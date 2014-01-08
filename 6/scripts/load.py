
from dateutil.parser import parse
import pandas as pd
import os
from collections import defaultdict


def load():
    pass

def get_paths():
    """
    Redefine data_path and submissions_path here to run the benchmarks on your machine
    """
    data_path = os.environ["DATAPATH"]
    submission_path = os.environ["DATAPATH"]
    return data_path, submission_path

def get_train_test_df(data_path = None):
    if data_path is None:
        data_path, submission_path = get_paths()

    train = pd.read_csv(os.path.join(data_path, "train.csv"),
        converters={"timestamp": parse})
    test = pd.read_csv(os.path.join(data_path, "test.csv"),
        converters={"timestamp": parse})
    return train, test

