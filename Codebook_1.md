Dataset name:
Description:

This codebook describes data transformations

                     that were applied to data from Human Activity Recognition 

                     Using Smartphones Dataset. First, the files containing the training 

                     and test data, the respondent id, activity labels were loaded and the

                     variables renamed. Then the three training files were combined and 

                     the three test files were combined using cbind. Next, these two data sets

                     were combined using rbind. Next, the value labels for activities

                     were renamed with the corresponding activity labels. Then the variables

                     were renamed to be more easily human readable. Next, a separate dataframe

                     was created with only the variables measuring mean and standard deviation.

                     Then these variables were grouped by id and activity in a separate 

                     dataframe and summarized by mean.

Column Attributes:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
Codebook
codebook
