venv() {
  VENV_DIR="venv"

  # Check if the virtual environment exists.
  if [ ! -d "$VENV_DIR" ]; then
    echo "No virtual environment found. Creating one..."
    python3 -m venv $VENV_DIR
  fi

  # Activate the virtual environment
  if [ -f "$VENV_DIR/bin/activate" ]; then
    echo "Activating virtual environment..."
    source "$VENV_DIR/bin/activate"
    echo "Virtual environment successfully activated!"
  else
    echo "Error: Unable to activate the virtual environment!"
  fi

}
