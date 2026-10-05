import numpy as np
from sklearn.metrics.pairwise import cosine_similarity

def similar_users(matrix):
    sim = cosine_similarity(matrix)
    np.fill_diagonal(sim, 0)
    return sim

def recommend(user_idx, matrix, sim, top_k=10):
    scores = sim[user_idx] @ matrix
    return np.argsort(scores)[::-1][:top_k]
