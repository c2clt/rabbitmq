#------------------------------------------------------------------
"""
DOCKER TUTORIAL => How to connect a PYTHON container to RABBITMQ container
Date: 19JAN2021
Author: Andre
"""
#------------------------------------------------------------------

import sys
import pika
from flask import Flask

#-------------------------------------------------------------------
def routeHello():
    return "Hello from Python!"
#-------------------------------------------------------------------

#-------------------------------------------------------------------
def routeTest():
    return "Test from Python!"
#-------------------------------------------------------------------

#-------------------------------------------------------------------
def routeWriteRabbit():
    #------------------------------------------------------------------
    print ('**** Connecting to RabbitMQ ****', flush=True)
    credentials = pika.PlainCredentials('guest', 'guest')
    #param = pika.URLParameters('amqp://rabbitmq')
    param = pika.ConnectionParameters('rabbitmq', 5672, '/', credentials)
    connection = pika.BlockingConnection(param)
    channel = connection.channel()
    print ('**** Connected to RabbitMQ ****', flush=True)
    #------------------------------------------------------------------
    channel.queue_declare(queue='testQueue')
    channel.basic_publish(exchange='', routing_key='testQueue', body='Test Message.')
    connection.close()
    return "Message added to Rabbitmq!"
#---------------------------------------------------------------------

#---------------------------------------------------------------------
# In this example the furnction only gets a single message and returns
# Check how to deploy a wroker to keep tracking new messages
def routeReadRabbit():
    #------------------------------------------------------------------
    credentials = pika.PlainCredentials('guest', 'guest')
    #param = pika.URLParameters('amqp://rabbitmq')
    param = pika.ConnectionParameters('rabbitmq', 5672, '/', credentials)
    connection = pika.BlockingConnection(param)
    channel = connection.channel()
    #------------------------------------------------------------------
    channel.queue_declare(queue='testQueue')
    #channel.basic_consume(callback, queue='testQueue', no_ack=True)
    #channel.basic_consume(callback, no_ack=True)

    bodydecod = channel.basic_consume('testQueue', callback, auto_ack=True)
    channel.start_consuming()
    return "Message consumed"
#----------------------------------------------------------------------

#----------------------------------------------------------------------
def callback(ch, method, properties, body):
    # list containers with "docker ps" 
    # check the log with "docker logs <container id>"
    print("Received %r" % body, flush=True)
    ch.stop_consuming()
#----------------------------------------------------------------------

#----------------------------------------------------------------------
def main():
    """ This is the main function """

    PORT = 8005
    app = Flask(__name__)

    # FOR ROUTING WITH FLASK CHECK:
    # https://hackersandslackers.com/flask-routes/
    @app.route("/")
    def hello():
        return routeHello()

    @app.route("/test")
    def test():
        return routeTest()
    
    @app.route("/write")
    def writeRabbit():
        return routeWriteRabbit()

    @app.route("/read")
    def readRabbit():
        return routeReadRabbit()

    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=int(PORT), debug=True)   

#-------------------------------------------------------------------

#-------------------------------------------------------------------
main()
#-------------------------------------------------------------------

