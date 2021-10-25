from flask import Flask, render_template, redirect, request, url_for, session
from flask_mysqldb import MySQL, MySQLdb
import bcrypt

app = Flask(__name__, template_folder='template')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'flaskdb'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/')
def home():
    return render_template("home.html")
#=================User========================#
@app.route('/register', methods=["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form['name']
        phone = request.form['phone']
        gender = request.form['gender']
        email = request.form['email']
        password = request.form['password'].encode('utf-8')
        hash_password = bcrypt.hashpw(password, bcrypt.gensalt())

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users VALUES (NULL, %s,%s,%s,%s,%s)", (name, phone, gender, email, hash_password,))
        mysql.connection.commit()
        session['name'] = name
        session['phone'] = phone
        session['gender'] = gender
        session['email'] = email
        return render_template('login.html')
    else:
        return render_template("register.html")
        

@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form['email']
        password = request.form['password'].encode('utf-8')

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM users where email=%s",(email,))
        user = cur.fetchone()
        cur.close()

        if len(user) > 0:
            if bcrypt.hashpw(password, user['password'].encode('utf-8')) == user['password'].encode('utf-8'):
                session['name'] = user['name']
                session['phone'] = user['phone']
                session['gender'] = user['gender']
                session['email'] = user['email']

                return render_template('home.html')
            else:
                return "Error password or user not match"
        else:
            return "Error password or user not match"
    else:
        return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return render_template('home.html')
#=================User========================#

#=================Book========================#
@app.route('/books')
def books():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM books')
    books = cur.fetchall()
    cur.close()
    return render_template('book.html', books=books)

@app.route('/createBook',methods=["POST"])
def createBook():
    judul = request.form['title']
    pengarang = request.form['author']
    harga = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO books VALUES (NULL, %s,%s,%s)",(judul, pengarang, harga,))
    mysql.connection.commit()
    return redirect(url_for('books'))

@app.route('/updateBook',methods=["POST"])
def updateBook():
    id_data = request.form.get('id')
    judul = request.form['title']
    pengarang = request.form['author']
    harga = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("UPDATE books SET title=%s, author=%s, price=%s WHERE book_id=%s",(judul, pengarang, harga, id_data))
    mysql.connection.commit()
    return redirect(url_for('books'))

@app.route('/deleteBook/<string:id_data>',methods=["GET"])
def deleteBook(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM books WHERE book_id=%s",(id_data,))
    mysql.connection.commit()
    return redirect(url_for('books'))
#===================Book========================================#

#===================Course========================================#
@app.route('/courses')
def courses():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM courses')
    courses = cur.fetchall()
    cur.close()
    return render_template('course.html', courses=courses)

@app.route('/createCourse',methods=["POST"])
def createCourse():
    pelatihan = request.form['name']
    materi = request.form['title']
    harga = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO courses VALUES (NULL, %s,%s,%s)",(pelatihan, materi, harga,))
    mysql.connection.commit()
    return redirect(url_for('courses'))

@app.route('/updateCourse',methods=["POST"])
def updateCourse():
    id_data = request.form.get('id')
    pelatihan = request.form['name']
    materi = request.form['title']
    harga = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("UPDATE courses SET name=%s, title=%s, price=%s WHERE course_id=%s",(pelatihan, materi, harga, id_data))
    mysql.connection.commit()
    return redirect(url_for('courses'))

@app.route('/deleteCourse/<string:id_data>',methods=["GET"])
def deleteCourse(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM courses WHERE course_id=%s",(id_data,))
    mysql.connection.commit()
    return redirect(url_for('courses'))
#===================Course========================================#

#===================Device========================================#
@app.route('/devices')
def devices():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM devices')
    devices = cur.fetchall()
    cur.close()
    return render_template('device.html', devices=devices)

@app.route('/createDevice',methods=["POST"])
def createDevice():
    nama_brg = request.form['name']
    tipe_brg = request.form['type']
    harga_brg = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO devices VALUES (NULL, %s,%s,%s)",(nama_brg, tipe_brg, harga_brg,))
    mysql.connection.commit()
    return redirect(url_for('devices'))

@app.route('/updateDevice',methods=["POST"])
def updateDevice():
    id_data = request.form.get('id')
    nama_brg = request.form['name']
    tipe_brg = request.form['type']
    harga_brg = request.form['price']
    cur = mysql.connection.cursor()
    cur.execute("UPDATE devices SET name=%s, type=%s, price=%s WHERE device_id=%s",(nama_brg, tipe_brg, harga_brg, id_data))
    mysql.connection.commit()
    return redirect(url_for('devices'))

@app.route('/deleteDevice/<string:id_data>',methods=["GET"])
def deleteDevice(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM devices WHERE device_id=%s",(id_data,))
    mysql.connection.commit()
    return redirect(url_for('devices'))
#===================Device========================================#
#===================News==========================================#
@app.route('/news')
def news():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM news')
    news = cur.fetchall()
    cur.close()
    return render_template('news.html', news=news)

@app.route('/createNews',methods=["POST"])
def createNews():
    judul = request.form['title']
    deskripsi = request.form['description']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO news VALUES (NULL, %s,%s)",(judul, deskripsi,))
    mysql.connection.commit()
    return redirect(url_for('news'))

@app.route('/updateNews',methods=["POST"])
def updateNews():
    id_data = request.form.get('id')
    judul = request.form['title']
    deskripsi = request.form['description']
    cur = mysql.connection.cursor()
    cur.execute("UPDATE news SET title=%s, description=%s WHERE news_id=%s",(judul, deskripsi, id_data))
    mysql.connection.commit()
    return redirect(url_for('news'))

@app.route('/deleteNews/<string:id_data>',methods=["GET"])
def deleteNews(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM news WHERE news_id=%s",(id_data,))
    mysql.connection.commit()
    return redirect(url_for('news'))
#===================News========================================#

if __name__ == '__main__':
    app.secret_key = "Reydri@101197&12345"
    app.run(debug=True)