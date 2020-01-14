import boto3
import os

def handler(event, context):
    print("My first lambda")
    print(os.environ["ENV_VAR1"])
    print(os.environ["ENV_VAR2"])