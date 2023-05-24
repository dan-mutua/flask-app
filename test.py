import unittest
from flask import Flask
from app  import app 

class AppTestCase(unittest.TestCase):
    def setUp(self):
        self.app = Flask(__name__)
        self.client = self.app.test_client()


    def test_hello_world(self):
        response = app.test_client().get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, b'Hello, Welcome to my app')

if __name__ == '__main__':
    unittest.main()

