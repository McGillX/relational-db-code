--students who got over 60 and wrote on the board.
SELECT certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, certificates_generatedcertificates.grade, forum_text_created.event_type, forum_text_created.course_id
from certificates_generatedcertificates INNER join forum_text_created ON
certificates_generatedcertificates.user_id=forum_text_created.user_id
WHERE certificates_generatedcertificates.grade >=0.6
ORDER BY course_id, certificates_generatedcertificates.grade DESC;

--students who got over 60 and voted on the board.
SELECT certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, certificates_generatedcertificates.grade, 
forum_text_voted.event_type
FROM certificates_generatedcertificates INNER JOIN forum_text_voted ON
certificates_generatedcertificates.user_id=forum_text_voted.user_id
WHERE certificates_generatedcertificates.grade >=0.6
ORDER BY certificates_generatedcertificates.grade;

--students who got over 60 and voted. compressed with counts per vote type.
SELECT certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, certificates_generatedcertificates.grade, forum_text_voted.course_id,
forum_text_voted.event_type, COUNT(*) AS eventCount
FROM certificates_generatedcertificates INNER JOIN forum_text_voted ON
certificates_generatedcertificates.user_id=forum_text_voted.user_id
GROUP BY certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, forum_text_voted.event_type, certificates_generatedcertificates.grade, forum_text_voted.course_id
HAVING certificates_generatedcertificates.grade >=0.6
ORDER BY forum_text_voted.course_id, certificates_generatedcertificates.grade DESC;

--students who got over 60 and created a post. compressed with counts per post type.
SELECT certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, certificates_generatedcertificates.grade, forum_text_created.course_id,
forum_text_created.event_type, COUNT(*) AS eventCount
FROM certificates_generatedcertificates INNER JOIN forum_text_created ON
certificates_generatedcertificates.user_id=forum_text_created.user_id
GROUP BY certificates_generatedcertificates.user_id, certificates_generatedcertificates.name, forum_text_created.event_type, certificates_generatedcertificates.grade, forum_text_created.course_id
HAVING certificates_generatedcertificates.grade >0
ORDER BY forum_text_created.course_id, certificates_generatedcertificates.grade DESC;

--students who got over 60 and voted. compressed with counts per vote type. - anon
SELECT certificates_generatedcertificates.user_id, certificates_generatedcertificates.grade, forum_text_voted.course_id,
forum_text_voted.event_type, COUNT(*) AS eventCount
FROM certificates_generatedcertificates INNER JOIN forum_text_voted ON
certificates_generatedcertificates.user_id=forum_text_voted.user_id
GROUP BY certificates_generatedcertificates.user_id, forum_text_voted.event_type, certificates_generatedcertificates.grade, forum_text_voted.course_id
HAVING certificates_generatedcertificates.grade >=0.6
ORDER BY forum_text_voted.course_id, certificates_generatedcertificates.grade DESC;

--students who got over 60 and created a post. compressed with counts per post type. - anon
SELECT certificates_generatedcertificates.user_id, forum_text_created.user_course_role as role, certificates_generatedcertificates.grade, forum_text_created.course_id,
forum_text_created.event_type, COUNT(*) AS eventCount
FROM certificates_generatedcertificates INNER JOIN forum_text_created ON
certificates_generatedcertificates.user_id=forum_text_created.user_id
GROUP BY certificates_generatedcertificates.user_id,forum_text_created.user_course_role, forum_text_created.event_type, certificates_generatedcertificates.grade, forum_text_created.course_id
HAVING certificates_generatedcertificates.grade >=0.6
ORDER BY forum_text_created.course_id, certificates_generatedcertificates.grade DESC;









