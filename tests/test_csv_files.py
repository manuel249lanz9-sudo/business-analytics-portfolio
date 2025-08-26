import os
import glob
import pandas as pd


def test_csv_files():
    """
    Simple smoke test to ensure CSV files in the repository can be read by pandas without errors.
    """
    # Determine the base directory (parent of this tests folder)
    base_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    # Find all CSV files in the base directory
    csv_files = glob.glob(os.path.join(base_dir, "*.csv"))
    assert csv_files, "No CSV files found to test."

    # Iterate through each CSV file and attempt to load with pandas
    for csv_file in csv_files:
        df = pd.read_csv(csv_file)
        # Ensure the DataFrame is not empty
        assert not df.empty, f"{os.path.basename(csv_file)} produced an empty DataFrame"
