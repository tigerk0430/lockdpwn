import numpy as np
import tensorflow as tf

class DQN:
    def __init__(self, session, input_size, output_size, name="main"):
        self.session = session
        self.input_size = input_size
        self.output_size = output_size
        self.net_name = name

        self._build_network()

    # 인공신경망 모델을 구축하는 함수 
    # h_size : hidden size
    # l_rate : learning rate
    def _build_network(self, h_size=32, l_rate=1e-3):
        with tf.variable_scope(self.net_name):
            self._X = tf.placeholder(tf.float32, [None, self.input_size], name="input_x")

            # First layer of weights
            # 1번째 레이어
            W1 = tf.get_variable("W1", shape=[self.input_size, h_size], initializer=tf.contrib.layers.xavier_initializer())
            layer1 = tf.nn.tanh(tf.matmul(self._X, W1))

            # 2번째 레이어
            W2 = tf.get_variable("W2", shape=[h_size, h_size], initializer=tf.contrib.layers.xavier_initializer())
            layer2 = tf.nn.tanh(tf.matmul(layer1, W2))

            # 3번째 레이어
            W3 = tf.get_variable("W3", shape=[h_size, h_size], initializer=tf.contrib.layers.xavier_initializer())
            layer3 = tf.nn.tanh(tf.matmul(layer2, W3))

            # 4번째 레이어
            W4 = tf.get_variable("W4", shape=[h_size, self.output_size], initializer=tf.contrib.layers.xavier_initializer())

            self._Qpred = tf.matmul(layer3, W4)

        # We need to define the parts of the network needed for learning a policy
        # 정답데이터 
        self._Y = tf.placeholder(shape=[None, self.output_size], dtype=tf.float32)

        # Loss function
        self._loss = tf.reduce_mean(tf.square(self._Y - self._Qpred))

        # Learning
        self._train = tf.train.AdamOptimizer(learning_rate=l_rate).minimize(self._loss)


    # 훈련데이터를 예측하는 함수
    def predict(self, state):
        x = np.reshape(state, [1, self.input_size])
        return self.session.run(self._Qpred, feed_dict={self._X: x})


    # 학습데이터를 학습하는 함수
    def update(self, x_stack, y_stack):
        return self.session.run([self._loss, self._train], feed_dict={self._X: x_stack, self._Y: y_stack})