from flask import render_template,redirect,flash,url_for,request
from flaskblog import app,db,bcrypt
from flaskblog.forms import Registration, LoginForm
from flaskblog.models import People
from flask_login import login_user,current_user,logout_user
import numpy as np
import keras
from tensorflow.python.keras.models import load_model

mp = load_model('keras_model.h5')

@app.route('/')
@app.route('/home')
def home():
    return render_template("home.html")


@app.route('/user/',methods=['GET','POST'])
def user():
    if current_user.is_authenticated:
        return redirect(url_for('user_again'))
    form=LoginForm()
    if form.validate_on_submit():
        user1=People.query.filter_by(username=form.username.data).first()
        if not user1 or not bcrypt.check_password_hash(user1.password,form.password.data):
            flash('Invalid username or password')
            return redirect(url_for('user'))

        else:
            login_user(user1,remember=form.remember_me.data)
            return redirect(url_for('user_again'))
    return render_template("user.html",title="user",form=form)

@app.route('/admin_again/', methods=['GET','POST'])
def admin_again():
    return render_template("admin_again.html")

@app.route('/signup/', methods=['GET','POST'])
def signup():
    if current_user.is_authenticated:
        return redirect(url_for('user_again'))

    form=Registration()
    if form.validate_on_submit():
        db.create_all()
        hash_pass=bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user1=People(username=form.username.data, email=form.username.data, password=hash_pass)
        db.session.add(user1)
        db.session.commit()
        flash('Your account has been created..You can now Login ','success')
        return redirect(url_for('user'))
    return render_template("signup.html",title="register",form=form)




@app.route('/Heart_Analysis/')
def Heart_Analysis():
    return render_template("Heart_Analysis.html")

@app.route('/Feedback/')
def Feedback():
    return render_template("Feedback.html")

@app.route('/Logout/')
def Logout():
    logout_user()
    return redirect(url_for('home'))

@app.route('/Add_data/')
def Add_data():
    return render_template("Add_data.html")

@app.route('/view_user/')
def view_user():
    return render_template("view_user.html")

@app.route('/view_training_data/')
def view_training_data():
    return render_template("view_training_data.html")

@app.route('/view_feedback/')
def view_feedback():
    return render_template("view_feedback.html")

@app.route("/admin_view/")
def admin_view():
    return render_template("admin_view.html")





@app.route('/admin/')
def admin():

    return render_template("admin.html")

@app.route('/user_view/')
def user_view():
    return render_template("user_view.html")

@app.route('/user_again/',methods=['GET','POST'])
def user_again():
    return render_template('user_again.html')

@app.route('/predict', methods=['GET','POST'])
def predict():
    int_features=[int(x) for x in request.form.values()]
    final = np.array(int_features)
    print(int_features)
    prediction=mp.predict_proba(final)
    output='{0:.{1}f}'.format(prediction[0][1], 2)

    if output>str(0.5):
        return render_template('Feedback.html',pred='Your Heart is in Danger.\nProbability of heart disease is {}'.format(output),bhai="Treatment kara lo")
    else:
        return render_template('Feedback.html',pred='Your Heart is safe.\n Probability of Heart disease is {}'.format(output),bhai="Your Heart is Safe now")
