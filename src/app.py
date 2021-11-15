#import matplotlib.pyplot as plt
import ruptures as rpt
import numpy as np
import pandas as pd
import json
import os

iexec_in = os.environ['IEXEC_IN']
iexec_out = os.environ['IEXEC_OUT']
dataset_filename = os.environ['IEXEC_DATASET_FILENAME']

signal = pd.read_csv(iexec_in + '/' + dataset_filename)

algo = rpt.Pelt(model="rbf").fit(signal)
result = algo.predict(pen=10)

rpt.display(signal, [], result)
# plt.savefig('{}/results_change_point_detect.pdf'.format(iexec_out))

with open(iexec_out + '/computed.json', 'w+') as f:
    json.dump({"deterministic-output-path": iexec_out +
              '/results_change_point_detect.pdf'}, f)
