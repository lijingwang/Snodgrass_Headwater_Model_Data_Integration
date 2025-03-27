import sys
sys.dont_write_bytecode = True

#from pyprojroot import here
#root = here(project_files=[".here"])
sys.path.append('../')

import os
import yaml
import itertools
import numpy as np
from typing import List, Tuple


def get_range_val(range_var_dict: dict) -> float:
    """Returns a random value from within the specified range for a particular variable.
    
    Args:
        range_var_dict (dict): Sub-dictionary containing the low and high values of the range.
        
    Returns:
        float: Returns the random float between the specied range.
    """
    
    low = float(eval(str(range_var_dict["low"])))
    high = float(eval(str(range_var_dict["high"])))
    
    if low < 1e-3 and low > 0:
        rand_val = np.power(10,np.random.uniform(np.log10(low), np.log10(high)))
    else:
        rand_val = np.random.uniform(low, high)
    
    return rand_val


def cast_variable_types(config_dict: dict) -> dict:
    """Converts all the configurations params from str to float.
    
    Args:
        config_dict (dict): Input configuration dictionary.
    
    Returns:
        dict: Returns type casted configuration dictionary.
    """
    
    return {k: float(eval(str(config_dict[k]))) for k in config_dict}


def is_perm_possible(yaml_vals: dict, perm_key_list: list) -> bool:
    """Check if the permutations are possible for the given variable maps.
    
    Args:
        yaml_vals (dict): The dictionary containing the input variable maps.
        perm_key_list (list): List of variables that contain list values.
    
    Returns:
        bool: Returns True if permutations are possible, False otherwise.
    """
    
    for k in perm_key_list:
        if len(yaml_vals[k]) > 1:
            return True
    
    return False


def get_config_list_util(yaml_vals: dict, num_sims: int, output_dir: str) -> List[dict]:
    """ Returns the list of all configurations that are generated from the input variable maps.
    This is a utility function to the parent function that performs the necessary checks.
    
    There are 3 type of input maps that are handled for the variables:
    When there are multiple values for a variable, the simulations are run using all permutations of the variables with multiple values.
    When a range is provided for a variable, a random value is picked from that range.
    When a single value is provided for a variable, the exact value is used for the simulation.
    
    Three kinds of variable maps can be provided as input:
    CASE 1:
    When one or more variable have multiple values and the remaining values have either single value or has a range specified.
    
    CASE 2:
    When one or more variables have range specified as values and all the remaining variables have a single value.
    
    CASE 3:
    When all the variables have just a single value.
    
    Args:
        yaml_vals (dict): The dictionary containing the input variable maps.
        num_sims (int): Number of simulation configurations to generate.
        output_dir (str): Path to the output directory containing all the simulation subdirectories.
    
    Returns:
        List[dict]: Returns a list of all the simulation configurations.
    
    Raises:
        ValueError: Raises error if the number of simulations is less than 1.
    """

    # Separate the permutations and range variables
    dict_key_list = list()
    perm_key_list = list()
    
    for k in yaml_vals:
        if type(yaml_vals[k]) == type(dict()):
            dict_key_list.append(k)
        elif type(yaml_vals[k]) == type(list()):
            perm_key_list.append(k)
        else:
            pass
    print("Permutation and Range variables separated.")
    
    # List of all the configurations. Each configuration is a dict of param, value.
    configs_list = list()

    if len(perm_key_list) > 0 and is_perm_possible(yaml_vals, perm_key_list):
        ############
        # CASE 1: Permutations are to be made between list of values for 
        # certain or all variables.
        # Number of simulations is ignored in this case.
        ######
        print("Processing CASE 1...")
        
        config_dict = dict()
        sno = 0    # used for serializing each simulation parameter
        
        # iterating over range VARIABLES
        for dict_ki in dict_key_list:
            config_dict[dict_ki] = get_range_val(yaml_vals[dict_ki])
        
        # Create all the possible permutations with the variable values
        perm_vars = [yaml_vals[ki] for ki in perm_key_list]
        perm_configs = itertools.product(*perm_vars)
        
        # Iterating over multiple CONFIGURATIONS
        for config_i in perm_configs:
            
            config_dict_i = config_dict.copy()
            
            # Appending permutation variables to the range variables
            for i, ki in enumerate(perm_key_list):
                config_dict_i[ki] = config_i[i]
            
            config_dict_i = cast_variable_types(config_dict_i)
            
            # Appending serial number for record and simulation path to process 
            # different responses during surrogate modeling.
            config_dict_i["@serial_number@"] = sno
            config_dict_i["@sim_path@"] = os.path.join(output_dir, f"sim{sno}")
            sno += 1
            configs_list.append(config_dict_i)
    
    elif len(dict_key_list) > 0:
        ############
        # CASE 2: Ranges are provided for certain or all variables. 
        # And there is just a single value for all the remaining variables.
        # Run N simulations.
        ######
        print("Processing CASE 2...")
        
        if num_sims < 1:
            raise ValueError("Incorrect value for the number of simulations parameter.")
        
        for i in range(num_sims):
            config_dict_i = {"@serial_number@": i,
                             "@sim_path@": os.path.join(output_dir, f"sim{i}")}
            
            # setting all the values for the perm_key_list variables
            # in this case, there is just 1 value for each perm_key_list variable
            for k in perm_key_list:
                config_dict_i[k] = float(eval(str(yaml_vals[k][0])))
            
            # generating random value within the range for each variable
            for dict_ki in dict_key_list:
                config_dict_i[dict_ki] = get_range_val(yaml_vals[dict_ki])
                
            configs_list.append(config_dict_i)
    
    else:
        ############
        # CASE 3: All variables have just a single value.
        # Number of simulations is ignored in this case as there is only one configuration possible.
        ######
        print("Processing CASE 3...")
        
        sno = 0
        config_dict_i = {"@serial_number@": sno,
                         "@sim_path@": os.path.join(output_dir, f"sim{sno}")}
        
        for k in perm_key_list:
            config_dict_i[k] = float(eval(str(yaml_vals[k][0])))
            
        configs_list.append(config_dict_i)
    
    return configs_list


def is_input_correctly_formatted(yaml_vals: dict) -> Tuple[bool, str]:
    """Check if the input variable map YAML file is correctly formatted.
    
    Args:
        yaml_vals (dict): The dictionary containing the input variable maps.
        
    Returns:
        Tuple [bool, str]: Returns the formatting status and status message.
    """
    
    validity_msg = "SUCCESS: ok"
    
    for k in yaml_vals:
        if type(yaml_vals[k]) == type(dict()) or type(yaml_vals[k]) == type(list()):
            pass
        else:
            validity_msg = "ERROR: Incorrect variable value type in the input variable map YAML file."
            
            #return False, validity_msg
    
    return True, validity_msg


def get_config_list(mapping_file: str, num_sims: int, output_dir: str) -> List[dict]:
    """Checked the input variable maps and returns the list of all configurations that are generated from the input variable maps.
    
    Args:
        mapping_file (str): Path to the file that contains all the input variable maps.
        num_sims (int): Number of simulation configurations to be generated.
        output_dir (str): Directory containing all the simulations subdirectories.
        
    Returns:
        List[dict]: Returns a list of all the simulation configurations.
        
    Raises:
        ValueError: This error is raised if the YAML file is not correctly formatted.
    """
    
    # Reading the YAML file.
    yaml_vals = yaml.load(open(mapping_file, "r"), Loader=yaml.FullLoader)
    print("YAML read.")
    
    # Checking if the input format is correct.
    is_input_valid, validity_msg = is_input_correctly_formatted(yaml_vals)
    
    if is_input_valid:
        # Return the configurations if the input file is valid.
        print("YAML file is valid.")
        return get_config_list_util(yaml_vals, num_sims, output_dir)
    else:
        raise ValueError(validity_msg)


# ONLY USED FOR DEBUGGING AND TESTING
if __name__ == "__main__":
    cl = get_config_list(mapping_file="/global/scratch/satyarth/Projects/lbnl-amanzi-emsemble-sim/variable_maps/test_direct.yml",
                         num_sims=10,
                         output_dir="/global/scratch/satyarth/Projects/ensemble_simulation_runs/delete_1")
    
    from pprint import pprint
    pprint(cl)