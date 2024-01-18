from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def welcome():
    user_agent = request.headers.get('User-Agent', 'Unknown')
    return f"Welcome to 2022! User Agent: {user_agent}"

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify(status='healthy')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
