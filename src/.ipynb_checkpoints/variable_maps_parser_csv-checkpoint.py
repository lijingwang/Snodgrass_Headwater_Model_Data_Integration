import pandas as pd
import ast
import os
from typing import List

def csv_to_configurations(csv_file: str, output_dir: str) -> List[dict]:
    """Converts CSV input to a list of configurations for simulations.
    
    Args:
        csv_file (str): Path to the CSV file with variables as columns and rows as configurations.
        output_dir (str): Directory to store simulation configurations.
    
    Returns:
        List[dict]: A list of configuration dictionaries for each simulation.
    """
    # Read the CSV
    df = pd.read_csv(csv_file)
    configs_list = []

    # Loop through each row to create a configuration
    for i, row in df.iterrows():
        config_dict = {"@serial_number@": i, "@sim_path@": os.path.join(output_dir, f"sim{i}")}

        for variable, value in row.items():
            # Handle list-like values stored as strings (e.g., "[1, 2, 3]")
            if isinstance(value, str) and value.startswith('[') and value.endswith(']'):
                config_dict[variable] = ast.literal_eval(value)  # Convert to list
            else:
                config_dict[variable] = float(value)  # Convert to float for single values

        configs_list.append(config_dict)

    return configs_list

def get_config_list_from_csv(csv_file: str, output_dir: str) -> List[dict]:
    """Wrapper function to process CSV and get simulation configurations."""
    print("Reading CSV and generating configurations...")
    configs_list = csv_to_configurations(csv_file, output_dir)
    print(f"Generated {len(configs_list)} configurations.")
    return configs_list
