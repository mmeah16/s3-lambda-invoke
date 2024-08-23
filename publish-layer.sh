# Create the layer folder from the root of the project, change directories into it, make a Python directory and create a requirements.txt
mkdir layer; cd layer; mkdir python; touch requirements.txt

# Write the dependencies of the venv into the requirements.txt file
pip3 freeze > requirements.txt

# Install the requirements into the Python directory
pip install -r requirements.txt --platform manylinux2014_x86_64 --target . --python-version 3.12 --only-binary=:all:

# Zip up the Python directory
zip -r layer.zip python

# Publish the layer
aws lambda publish-layer-version --layer-name fastapi-layer --zip-file fileb://layer.zip --compatible-runtimes python3.12 --region us-east-1