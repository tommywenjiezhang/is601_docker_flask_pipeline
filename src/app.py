import os
from flask import render_template, Flask
import pyfiglet
from pystrich.qrcode import QRCodeEncoder

app = Flask(__name__)


@app.route('/')
def hello_world():
    f = pyfiglet.Figlet(font="slant")
    text = f.renderText("Hello World!")
    # encoder = QRCodeEncoder("https://github.com/tommywenjiezhang/")
    # encoder.save(os.path.join(app.root_path, 'static/qr_code.png'))
    return render_template('index.html', text=text)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
