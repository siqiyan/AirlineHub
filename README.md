## Introduction

This is a group project for my university course.

Given a number of cities with different pairwise distances (represented by
an adjacent matrix), this program
constructs a graph of airline route which connects all cities and tries to
minimize the number of "hub city" (the vertex with more than one edges).

The algorithms are modified from Kruskal's algorithm for minimal-spanning-tree,
however, in this case, it tries to minimize the number of hubs rather than the
weight of edges.

There are three different procedures for this algorithm, each uses a slightly
different order to find the optimal solution, and the final result will be the
one with the smallest number of hubs.

## Usage

Simply run demo.m and demo2.m in Matlab.

demo.m will run the algorithm on the original graph defined by matrix A.

demo2.m will generate a random graph with a given number of vertex and run the
algorithm on that graph. You can change the number of vertex by changing the
value of n in demo2.m
