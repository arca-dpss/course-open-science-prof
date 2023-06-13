# Attachment 

## Project Versions

- Basic ([Download](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/arca-dpss/course-open-science-prof/tree/main/materials/code/attachment/01-attachment-base)). Simple script and report.
- Medium ([Download](https://github.com/arca-dpss/course-open-science-prof/tree/main/materials/code/attachment/02-attachment-medium)). RStudio project, functional style, and renv.
- Advanced ([Download](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/arca-dpss/course-open-science-prof/tree/main/materials/code/attachment/03-attachment-advanced)). Using R-package project structure, renv, targets, and Docker.


## Project Information

The aim of the study is to assess the relationship between attachment towards the mother and social emotional problems in children in the 3rd and 4th year of primary school.


## Data

In the dataset we have the following variables:

- `id`: Children id code
- `grade`: Children school grade (third and fourth grade))
- `gender`: Children gender (0 = Male; 1 = Female)
- `ssm*` (da 1 a 15): Mother Security Scale (SS) items
- `sdq*` (da 1 a 25): Strength and Difficulties Questionnaire items

## Scoring Questionnaires

###  Mother Security Scale (SS)

Questionnaire with 15 items on a 4-point likert scale. The answers are coded as 1-2-3-4.

The total score is given by the average of the items. Higher scores indicate higher levels of security.

To construct the final score, it is necessary to invert the scores of items 1, 3, 4, 9, 10, 13, and 15. That is: 

> 1 --> 4<br>
> 2 --> 3<br> 3 --> 2<br> 4 --> 1

### Strength and Difficulties Questionnaire (SDQ)

Questionnaire with 25 items on a 3-point likert scale. The answers are coded as 0-1-2.

The total score is given by the sum of the items. Higher scores indicate more problems.

To construct the final score it is necessary to invert the scores of items 7, 11, 14, 21, 25. That is:

> 0-->2<br> 1-->1<br> 2-->0

We have 5 sub-scales formed by the items:

- **Emotion**	=	3, 8, 13, 16, 24
- **Conduct**	=	5, 7, 12, 18, 22
- **Hyper**	=	2, 10, 15, 21, 25
- **Peer**	=	6, 11, 14, 19, 23
- **Prosoc**	=	1, 4, 9, 17, 20

Two summary scores are created by adding the sub-scales:

- **Internalizing** = emotion + peer
- **Externalizing** = hyper + conduct
