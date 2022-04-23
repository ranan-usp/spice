import matplotlib.pyplot as plt
import numpy as np
 
 
def get_rotation_matrix(rad):
    
    rot = np.array([[np.cos(rad), -np.sin(rad)],
                    [np.sin(rad), np.cos(rad)]])
    return rot
 
x = 0   
y = 5500
 
# 始点
base_point = np.array([x,y])
x_points = []
y_points = []
 
for i in range(3):
    deg = i * 90
    rad = deg * np.pi / 180
    rot = get_rotation_matrix(rad)
    rotated = np.dot(rot, base_point)
    print(deg,rotated)
    x_points.append(rotated[0])
    y_points.append(rotated[1])
 
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
ax.scatter(x_points, y_points)
ax.grid(True)
 
plt.gca().set_aspect('equal', adjustable='box')
plt.show()