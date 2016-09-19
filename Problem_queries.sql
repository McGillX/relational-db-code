--counts for correct, incorrect, and partially correct for all questions, all students, all courses 
select correctness, count(*) as num from question_submission group by correctness order by count(*) DESC;

--counts for correct, incorrect, and partially correct for all questions, all students, all courses including column for total.
select correctness, count(*) as num, (SELECT count(*) from question_submission) as total from question_submission group by correctness order by count(*) DESC;

--counts for correct, incorrect, and partially correct for all questions, all students, all courses, and attempt # including column for total.
select question_submission.correctness, problem_submission.attempt_number, count(*) as num, (SELECT count(*) from question_submission) as total FROM question_submission;

--counts for correct, incorrect, and partially correct for all questions, all students, all courses, and attempt # 
select question_submission.correctness, problem_submission.attempt_number, count(*) as num FROM question_submission;


/* The queries below should be used as templates.
Replace the problem id's with those from your course.
*/

--How many students completed this problem?
select count(distinct(problem_submission.user_id)) from problem_submission 
INNER JOIN problem_definition ON problem_submission.problem_id=problem_definition.id
WHERE problem_definition.id = 'block-v1:McGillX+CHEM181x_3+3T2015+type@problem+block@27f82ebcd2b447e497255efc603edbf5';

--How many students completed all of the 11 problems below?
--Add or remove problems as you wish. Set the number at the end to be one fewer than the total number of problems.  
select count(*) from (select problem_submission.user_id from problem_submission
INNER Join problem_definition ON problem_submission.problem_id=problem_definition.id
WHERE (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@6817f286566d4e98a3c9f0ab7e29763b')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@5e6b697ab840472d8634419f40e7bd1b')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@d71ae806d1f6445fa391fda7529067ba')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@8d90b006fb524134a155d3ac2c06a5d1')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@9cd03f2a979548efb4f4e063dabc0c80')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@cdcc29f278a8432d990d7be89417ae63')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@9b83dec02d8c4d4cae0b868b466309e9')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@19d96924beac46529a77b5821c03ebb3')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@6e7b84e2868a4db4a33aeb42e71d4843')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@77ea8a88727d48208358af091f750c9a')
OR (problem_definition.id = 'block-v1:McGillX+ATOC185x+1T2016+type@problem+block@56bab7933d6d4af6b6fb70821619c287')
GROUP BY problem_submission.user_id
HAVING count(distinct(problem_definition.id)) >10) p;

