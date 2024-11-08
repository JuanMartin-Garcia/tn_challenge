#!/bin/bash

# Navigate to the project directory
cd "$(dirname "$0")"

echo "Creating folder structure..."

# Create folders
mkdir -p data/raw data/processed notebooks scripts reports

# Create notebook files
touch notebooks/01_data_exploration.ipynb \
      notebooks/02_data_preprocessing.ipynb \
      notebooks/03_modeling.ipynb \
      notebooks/04_evaluation.ipynb \
      notebooks/05_insights.ipynb

# Create script files
touch scripts/data_preprocessing.py \
      scripts/modeling.py \
      scripts/evaluation.py

# Create other files
touch requirements.txt LICENSE

echo "Adding content to requirements.txt..."

# Add content to requirements.txt
cat > requirements.txt << EOL
pandas
numpy
scikit-learn
matplotlib
seaborn
jupyter
ipykernel
xgboost
lightgbm
shap
EOL

echo "Configuring .gitignore..."

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    cat > .gitignore << EOL
# Ignore data files
/data/raw/
/data/processed/

# Ignore virtual environment folder
venv/

# Ignore Jupyter Notebook checkpoints
.ipynb_checkpoints

# Ignore system files
.DS_Store
EOL
fi

echo "Initializing git repository..."

# Initialize git repository if not already initialized
if [ ! -d .git ]; then
    git init
    git add .
    git commit -m "Initial commit with folder structure and basic files"
fi

echo "Setting up virtual environment..."

# Create virtual environment and activate it
python3 -m venv venv
source venv/bin/activate

echo "Upgrading pip and installing dependencies..."

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

echo "Registering Jupyter kernel..."

# Register the virtual environment kernel for Jupyter
python -m ipykernel install --user --name=b2b-sales-env

echo "Setup complete. You can now launch Jupyter Notebook using 'jupyter notebook'"

# Deactivate virtual environment after setup
deactivate
