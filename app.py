from flask import Flask, jsonify, request, session
from flask_mysqldb import MySQL
from flask_cors import CORS
import random
import json
import pickle
import numpy as np
import nltk
import io
import re
from PIL import Image
from flask import Flask, request, jsonify
from nltk.stem import WordNetLemmatizer
from keras.models import load_model
from werkzeug.security import generate_password_hash, check_password_hash
from spicebot import predict_class, get_response
from spicedetect import descriptions, predict_label
app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'spicefy'
mysql = MySQL(app)

CORS(app)

with open("intents.json") as file:
    intents = json.load(file)

@app.route('/')
def main():
    return "Selamat Datang"

@app.route('/rempah', methods=['GET', 'POST'])
def rempah():
# Read
    if request.method == 'GET':
        try:
            # koneksi mysql
            cur = mysql.connection.cursor()
            # query untuk mengambil semua data dalam tabel
            cur.execute("SELECT * FROM rempah")
            # fetchall mengambil semua data yang telah di query di atas, 
            # dan menyimpannya ke result
            result = cur.fetchall()
            # mengambil nama kolom dari tabel yang di query diatas (rempah)
            column_names = [i[0] for i in cur.description]
            
            # untuk membuat struktur dictionary dengan key dan value, 
            # karna result diatas hanya berupa json value tanpa ada key
            data = []
            for row in result:
                data.append(dict(zip(column_names, row)))
            
            # menutup koneksi
            cur.close()
            
            # mengembalikan return json
            return jsonify({"status": "succes", "rempah": data})
        except Exception as e:
            return jsonify({"error": str(e)})

# Create
    elif request.method == 'POST':
        try:
            nama_rempah = request.json['nama_rempah']
            deskripsi = request.json['deskripsi']
            nama_latin = request.json['nama_latin']
            image = request.json['image']
            
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO rempah(nama_rempah, nama_latin, deskripsi, image) values(%s, %s, %s, %s)", (nama_rempah, nama_latin, deskripsi, image),)
            mysql.connection.commit()
            cur.close()
            
            return jsonify({'message': 'data berhasil ditambahkan'})
        except Exception as e:
            return jsonify({"error": str(e)})

# Edit
@app.route('/rempah/edit-bloc', methods=['PUT'])
def edit_bloc():
    try:
        data = request.get_json()
        rempah_id = data['rempah_id']
        nama_rempah = data['nama_rempah']
        nama_latin = data['nama_latin']
        deskripsi = data['deskripsi']
        image = data['image']
            
        cur = mysql.connection.cursor()
        cur.execute("UPDATE rempah SET nama_rempah = %s, nama_latin = %s, deskripsi = %s, image = %s WHERE rempah_id = %s", (nama_rempah, nama_latin, deskripsi, image, rempah_id),)
        mysql.connection.commit()
        cur.close()
        return jsonify({'message': 'data berhasil diubah'})
    except Exception as e:
        return jsonify({"error": str(e)})

# Delete    
@app.route('/rempah/<int:rempah_id>', methods=['DELETE'])
def delete_rempah(rempah_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM rempah WHERE rempah_id = %s", (rempah_id,))
        mysql.connection.commit()
        cur.close()
        
        return jsonify({"message": "data berhasil dihapus"})
    except Exception as e:
        return jsonify({"error": str(e)})   

### ===================================================================================================================== ###

@app.route('/rempah/<int:rempah_id>', methods=['PUT'])
def edit_rempah(rempah_id):
    try:
        data = request.get_json()
        nama_rempah = data['nama_rempah']
        nama_latin = data['nama_latin']
        deskripsi = data['deskripsi']
        image = data['image']
            
        cur = mysql.connection.cursor()
        cur.execute("UPDATE rempah SET nama_rempah = %s, nama_latin = %s, deskripsi = %s, image = %s WHERE rempah_id = %s", (nama_rempah, nama_latin, deskripsi, image, rempah_id),)
        mysql.connection.commit()
        cur.close()
        return jsonify({'message': 'data berhasil diubah'})
    except Exception as e:
        return jsonify({"error": str(e)})

@app.route('/rempah/delete-bloc', methods=['DELETE'])
def delete_bloc():
    try:
        data = request.get_json()
        rempah_id = data['rempah_id']
        
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM rempah WHERE rempah_id = %s", (rempah_id,))
        mysql.connection.commit()
        cur.close()
        
        return jsonify({"message": "data berhasil dihapus"})
    except Exception as e:
        return jsonify({"error": str(e)})

@app.route('/detail_rempah/<int:rempah_id>', methods=['GET'])
def detail_rempah(rempah_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM rempah WHERE rempah_id = %s", (rempah_id,))
        result = cur.fetchall()
        
        if result:
            column_names = [i[0] for i in cur.description]
        
            data = []
            for row in result:
                data.append(dict(zip(column_names, row)))
            return jsonify(data)
        else:
            return jsonify({"message": "Data tidak ditemukan"})
    except Exception as e:
        return jsonify({"error": str(e)})
        cur.close()

@app.route('/chat', methods=["GET", "POST"])
def chatSpiceBot():
    chatInput = request.json['chatInput']
    ints = predict_class(chatInput)
    return jsonify(botReply=get_response(ints, intents))

@app.route("/predict", methods=["POST"])
def index():
    file = request.files.get('file')
    userid = request.form.get('userid')
    if file is None or file.filename == "":
        return jsonify({"error": "no file"})
    
    image_bytes = file.read()
    img = Image.open(io.BytesIO(image_bytes))
    img = img.resize((384, 384), Image.NEAREST)
    
    pred_label, pred_accuracy = predict_label(img)
    description = descriptions.get(pred_label, "Deskripsi tidak tersedia untuk jenis rempah ini.")
            
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO history(label, akurasi, user_id) values(%s, %s, %s)", (pred_label, pred_accuracy, userid),)
    mysql.connection.commit()
    cur.close()
    
    return jsonify({
        "label": pred_label,
        "accuracy": f"{pred_accuracy:.2f}%",
        "description": description
    })

# @app.route("/predict", methods=["POST"])
# def index():
#     try:
#         file = request.files.get('file')
#         userid = request.form.get('userid')

#         if file is None or file.filename == "":
#             return jsonify({"error": "No file provided"})

#         # Validasi bahwa file adalah gambar
#         allowed_extensions = {'png', 'jpg', 'jpeg', 'gif'}
#         if '.' in file.filename and file.filename.rsplit('.', 1)[1].lower() not in allowed_extensions:
#             return jsonify({"error": "Invalid file format. Allowed formats: png, jpg, jpeg, gif"})

#         image_bytes = file.read()
#         img = Image.open(io.BytesIO(image_bytes))
#         img = img.resize((384, 384), Image.NEAREST)

#         pred_label, pred_accuracy = predict_label(img)
#         description = descriptions.get(pred_label, "Deskripsi tidak tersedia untuk jenis rempah ini.")

#         # Tambahkan ke database
#         with mysql.connection.cursor() as cur:
#             cur.execute("INSERT INTO history(label, akurasi, user_id) VALUES (%s, %s, %s)",
#                         (pred_label, pred_accuracy, userid))
#             mysql.connection.commit()

#         return jsonify({
#             "label": pred_label,
#             "accuracy": f"{pred_accuracy:.2f}%",
#             "description": description
#         })

#     except Exception as e:
#         return jsonify({"error": f"An error occurred: {str(e)}"})


@app.route('/register', methods =['GET','POST'])
def register():
    if request.method == 'POST':
        # Logika pendaftaran untuk metode POST
        nama = request.json.get('nama')
        email = request.json.get('email')
        password = request.json.get('password')
        
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user WHERE email = %s", (email,))
        result = cur.fetchone()
        
        user_exists = result is not None
        # user_exists = Users.query.filter_by(email=email).first() is not None

        if user_exists:
            return jsonify({'message': 'Email sudah terdaftar!'})
        elif not nama or not password or not email:
            return jsonify({'message': 'Isi formulir dengan benar!'})
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            return jsonify({'message': 'Alamat email tidak valid!'})
        elif len(password) < 8:
            return jsonify({'message': 'Password harus memiliki setidaknya 8 karakter.'})

        # Menggunakan generate_password_hash untuk menghash password sebelum disimpan
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
        cur.execute("INSERT INTO user(nama, email, password) values(%s, %s, %s)", (nama, email, hashed_password,))
        mysql.connection.commit()
        cur.close()

            # Buat respons sukses
        return jsonify({'success': 'true', 'message': 'Registrasi anda berhasil, silahkan login!'})

@app.route('/login', methods=['GET', 'POST'])
def login():
    mesage = ''
    session = {}
    if request.method == 'POST' and 'email' in request.json and 'password' in request.json:
        email = request.json['email']
        password = request.json['password']
        cur = mysql.connection.cursor()

        if email == '' or password == '':
            mesage = 'Masukan email dan password'
        else:
            cur.execute("SELECT * FROM user WHERE email = %s", (email,))
            user = cur.fetchone()

            if user is None or not check_password_hash(user[3], password):
                message = 'Email atau password salah'
            else:
                session['loggedin'] = True
                session['userid'] = user[0]
                session['nama'] = user[2]
                session['email'] = user[1]
                mesage = 'true'
        cur.close()
    return jsonify({"success": mesage, "data": session})

@app.route('/history/<int:user_id>', methods=['GET'])
def history(user_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM history WHERE user_id = %s ORDER BY tanggal DESC", (user_id,))
        result = cur.fetchall()
        
        if result:
            column_names = [i[0] for i in cur.description]
        
            data = []
            for row in result:
                data.append(dict(zip(column_names, row)))
            return jsonify({"history": data})
        else:
            return jsonify({"message": "Data tidak ditemukan"})
    except Exception as e:
        return jsonify({"error": str(e)})
        cur.close()

@app.route('/profile/<int:user_id>', methods=['GET'])
def profile(user_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user WHERE id = %s", (user_id,))
        result = cur.fetchall()
        
        if result:
            column_names = [i[0] for i in cur.description]
        
            data = []
            for row in result:
                data.append(dict(zip(column_names, row)))
            return jsonify({"profile": data})
        else:
            return jsonify({"message": "Data tidak ditemukan"})
    except Exception as e:  
        return jsonify({"error": str(e)})
        cur.close()

if __name__ == '__main__':
    app.run(debug=True)