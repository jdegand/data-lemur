'''
import math

def mean(data):
    return sum(data) / len(data)

def std_dev(data):
    mean_val = mean(data)
    variance = sum((x - mean_val) ** 2 for x in data) / len(data)
    return math.sqrt(variance)

def covariance(X, Y):
    mean_X = mean(X)
    mean_Y = mean(Y)
    cov = sum((x - mean_X) * (y - mean_Y) for x, y in zip(X, Y)) / len(X)
    return cov

def corr(X, Y):
    std_X = std_dev(X)
    std_Y = std_dev(Y)
    cov = covariance(X, Y)
    pearson_coefficient = cov / (std_X * std_Y)
    return pearson_coefficient
'''

'''
import statistics

def corr(X, Y):
    mean_X = statistics.mean(X)
    mean_Y = statistics.mean(Y)
    std_X = statistics.stdev(X)
    std_Y = statistics.stdev(Y)
    covariance = statistics.covariance(X, Y)
    pearson_coefficient = covariance / (std_X * std_Y)
    return pearson_coefficient
'''
