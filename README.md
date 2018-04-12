#Research method for theoretical modelling
The matlab code is splitted into 3 folders:
1. *compare_execution_time* which is used to compare the time execution between the reference code (i.e. given at lecture), my improved version that does not change the dynamics (trajectory is actual the same if one fixes the seed), and the constrained dynamics.
2. *constrained_step* is used to analyse the mu dependence w.r.t temperature and time step. In particular the difference between the mu from lagrange multiplier and my effective mu is shown.
3. *self_consistent* contains the analysis of the phase transiton. There is a script for symmetric at low temperatures, hight temperatures, and the asymmetric case. In this script the correlation function, the edwards anderson and integrated response function is computed. However, the response function is not working well in the glassy case (yet to be investigated properly).
The other folders contains:
1. *Mathematica* contains the Mathematica script for checking the calculation of the article ''Dynamics of spin systems with randomly asymmetric bonds: Langevin dynamics and a spherical model''. The graph of response function is computed here. It does not work with Mathematica 8, but with higher version.
2. *Matlab files-20180214* Is the code given as reference from the lecturer. 
