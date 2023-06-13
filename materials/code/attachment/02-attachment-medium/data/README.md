# Data Description

The data is composed by 143 observations on 43 columns.

In the dataset we have the following variables:

- `id`: Character variable indicating children id code.
- `grade`: Numeric variable indicating children school grade (3 = third grade; 4 = fourth grade)).
- `gender`: Numeric variable indicating children gender (0 = Male; 1 = Female).
- `ssm*` (da 1 a 15): Numeric variable indicating Mother Security Scale (SS) items response (range values 1-4).
- `sdq*` (da 1 a 25): Numeric variable indicating Strength and Difficulties Questionnaire items (range values 0-2).

## Scoring Questionnaires

###  Mother Security Scale (SS)

Questionnaire with 15 items on a 4-point likert scale. The answers are coded as 1-2-3-4.

The total score is given by the average of the items. Higher scores indicate higher lvels of security.

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
