\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{graphicx}
\usepackage{tocloft}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
}

\title{B2B Sales Predictive Model}
\author{Your Name}
\date{\today}

\begin{document}

\maketitle

\tableofcontents

\section{Project Overview}

This project involves building a predictive model to estimate monthly sales and classify leads into sales tiers for B2B e-commerce lead generation. The model aims to:

\begin{itemize}
    \item \textbf{Predict Monthly Sales}: Provide accurate estimates for sales prioritization.
    \item \textbf{Classify Sales Tiers}: Segment leads into meaningful tiers for tailored strategies.
    \item \textbf{Generalize to Non-Customers}: Apply the model to potential leads.
    \item \textbf{Provide Actionable Insights}: Identify key factors influencing sales.
\end{itemize}

\section{Folder Structure}

The repository is organized as follows:

\begin{verbatim}
b2b-sales-predictive-model/
├── data/
│   ├── raw/                # Original data files (not tracked by Git)
│   ├── processed/          # Preprocessed data files
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_data_preprocessing.ipynb
│   ├── 03_modeling.ipynb
│   ├── 04_evaluation.ipynb
│   └── 05_insights.ipynb
├── scripts/
│   ├── data_preprocessing.py
│   ├── modeling.py
│   └── evaluation.py
├── reports/
│   └── presentation.pdf    # Final presentation
├── venv/                   # Virtual environment directory (not tracked by Git)
├── requirements.txt        # Python dependencies
├── setup.sh                # Bash script for automated setup
├── README.tex              # This README file in LaTeX format
├── .gitignore
└── LICENSE                 # Optional
\end{verbatim}

\section{Prerequisites}

\begin{itemize}
    \item \textbf{Operating System}: macOS
    \item \textbf{Python Version}: Python 3.6 or higher installed on your system
\end{itemize}

\section{Setup Instructions}

\subsection{Clone the Repository}

Open your terminal and clone the repository:

\begin{verbatim}
git clone https://github.com/yourusername/b2b-sales-predictive-model.git
cd b2b-sales-predictive-model
\end{verbatim}

\textbf{Note}: Replace \verb|https://github.com/yourusername/b2b-sales-predictive-model.git| with the actual URL of your GitHub repository.

\subsection{Create and Activate the Virtual Environment}

Create a Python virtual environment using \verb|venv|:

\begin{verbatim}
python3 -m venv venv
\end{verbatim}

Activate the virtual environment:

\begin{verbatim}
source venv/bin/activate
\end{verbatim}

\subsection{Install Dependencies}

Upgrade \verb|pip| and install the required packages:

\begin{verbatim}
pip install --upgrade pip
pip install -r requirements.txt
\end{verbatim}

\subsection{Set Up Jupyter Kernel}

Add the virtual environment as a Jupyter kernel:

\begin{verbatim}
python -m ipykernel install --user --name=b2b-sales-env
\end{verbatim}

\subsection{Launch Jupyter Notebook}

Start the Jupyter Notebook server:

\begin{verbatim}
jupyter notebook
\end{verbatim}

When you open a notebook, select the kernel named \verb|b2b-sales-env|:

\begin{itemize}
    \item Navigate to \textbf{Kernel} $\rightarrow$ \textbf{Change kernel} $\rightarrow$ \verb|b2b-sales-env|
\end{itemize}

\section{Usage}

With the environment set up, you can proceed to:

\begin{enumerate}
    \item \textbf{Data Exploration}: Open \verb|notebooks/01_data_exploration.ipynb| to explore the data.
    \item \textbf{Data Preprocessing}: Use \verb|notebooks/02_data_preprocessing.ipynb| to clean and preprocess the data.
    \item \textbf{Modeling}: Build predictive models in \verb|notebooks/03_modeling.ipynb|.
    \item \textbf{Evaluation}: Evaluate model performance in \verb|notebooks/04_evaluation.ipynb|.
    \item \textbf{Insights}: Analyze feature importance and derive insights in \verb|notebooks/05_insights.ipynb|.
\end{enumerate}

\section{Bash Script for Automated Setup}

To automate the setup process, you can run the provided \verb|setup.sh| bash script. This script will:

\begin{itemize}
    \item Create the required folder structure
    \item Create and activate the virtual environment
    \item Install dependencies
    \item Set up the Jupyter kernel
\end{itemize}

\subsection{Running the Script}

Make sure you have execution permissions and then run the script:

\begin{verbatim}
chmod +x setup.sh
./setup.sh
\end{verbatim}

\subsection{\texttt{setup.sh} Contents}

\begin{lstlisting}[language=bash,caption={setup.sh},label=setupsh]
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
\end{lstlisting}

\section{License}

This project is licensed under the MIT License -- see the \verb|LICENSE| file for details.

\section{Troubleshooting}

\subsection{Permission Denied Error When Running \texttt{setup.sh}}

Ensure the script has execute permissions:

\begin{verbatim}
chmod +x setup.sh
\end{verbatim}

\subsection{Jupyter Kernel Not Showing Up}

If the \verb|b2b-sales-env| kernel doesn't appear in Jupyter Notebook, try reinstalling the kernel:

\begin{verbatim}
python -m ipykernel install --user --name=b2b-sales-env --display-name "Python (b2b-sales-env)"
\end{verbatim}

\subsection{Python Version Issues}

Make sure you're using the correct version of Python. Check your Python version with:

\begin{verbatim}
python3 --version
\end{verbatim}

\subsection{Deactivating the Virtual Environment}

When you're done working, deactivate the virtual environment:

\begin{verbatim}
deactivate
\end{verbatim}

\subsection{Reactivating the Virtual Environment}

Before starting work in a new terminal session:

\begin{verbatim}
source venv/bin/activate
\end{verbatim}

\subsection{Installing Additional Packages}

If you need to install new packages, make sure the virtual environment is activated and then install the package:

\begin{verbatim}
pip install package_name
\end{verbatim}

Update the \verb|requirements.txt| file:

\begin{verbatim}
pip freeze > requirements.txt
\end{verbatim}

\section{Conclusion}

You now have a complete guide and a bash script to set up the project environment on a Mac. This setup ensures that anyone can replicate the environment and run the project seamlessly.

Feel free to reach out if you have any questions or need further assistance.

\end{document}

