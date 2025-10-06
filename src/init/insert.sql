-- Isi tabel roles 
INSERT INTO roles (role_id, role_name) VALUES
(1, 'instructor'),
(2, 'student');

-- Isi tabel user_base 
INSERT INTO user_base (user_id, email, role_id, password) VALUES
(1, 'john.doe@example.com', 1, 'hashed_password_instructor1'),
(2, 'jane.smith@example.com', 1, 'hashed_password_instructor2'),
(3, 'diana.ross@example.com', 1, 'hashed_password_instructor3'),
(101, 'alice@example.com', 2, 'hashed_password_student1'),
(102, 'bob@example.com', 2, 'hashed_password_student2'),
(103, 'charlie@example.com', 2, 'hashed_password_student3'),
(104, 'eve.walton@example.com', 2, 'hashed_password_student4'),
(105, 'frank.glen@example.com', 2, 'hashed_password_student5'),
(106, 'grace.hopper@example.com', 2, 'hashed_password_student6'),
(107, 'heidi.klum@example.com', 2, 'hashed_password_student7'),
(108, 'ivan.drago@example.com', 2, 'hashed_password_student8');

-- Isi tabel profile_user 
INSERT INTO profile_user (profile_id, fullname, no_hp, job, user_id, working_place, country_code) VALUES
(1, 'John Doe', '0811111111', 'Senior Software Engineer', 1, 'Big Tech Inc.', '+62'),
(2, 'Jane Smith', '0822222222', 'Lead Designer', 2, 'Creative Solutions', '+62'),
(3, 'Diana Ross', '0833333333', 'Marketing Expert', 3, 'Market Masters', '+62'),
(101, 'Alice Wonderland', '0855555555', 'Mahasiswa', 101, 'Universitas Koding', '+62'),
(102, 'Bob Builder', '0866666666', 'Mahasiswa', 102, 'Institut Teknologi', '+62'),
(103, 'Charlie Chaplin', '0877777777', 'Freelancer', 103, 'Remote', '+62'),
(104, 'Eve Walton', '0888888888', 'Analis Junior', 104, 'Data Analytics Co.', '+62'),
(105, 'Frank Glen', '0899999999', 'Mahasiswa', 105, 'Universitas Koding', '+62'),
(106, 'Grace Hopper', '0812223334', 'System Analyst', 106, 'GovTech', '+62'),
(107, 'Heidi Klum', '0813334445', 'Designer', 107, 'Fashion House', '+62'),
(108, 'Ivan Drago', '0814445556', 'IT Support', 108, 'Local Business', '+62');


-- Isi tabel course_categories 
INSERT INTO course_categories (category_id, category_name) VALUES
(10, 'Programming'),
(20, 'Design'),
(30, 'Business'),
(40, 'Marketing');

-- Isi tabel course_base 
INSERT INTO course_base (course_id, course_name, description, user_id, rating, category_id, review_count, price, duration, certificate) VALUES
(1001, 'Intro to Python', 'Learn Python from scratch with hands-on projects.', 1, 4.7, 10, 150, 49.99, 360, true),
(1002, 'Web Design Fundamentals', 'Master HTML, CSS, and responsive design principles.', 2, 4.8, 20, 210, 75.50, 480, true),
(1003, 'Startup Business 101', 'A complete guide to launching your first successful business.', 2, 4.6, 30, 95, 99.00, 600, true),
(1004, 'Advanced JavaScript', 'Deep dive into asynchronous JavaScript, closures, and modern patterns.', 1, 4.9, 10, 180, 120.00, 720, true),
(1005, 'Digital Marketing for Beginners', 'Learn SEO, SEM, and Social Media Marketing strategies.', 3, 4.7, 40, 110, 65.00, 420, true);

-- Isi tabel orders 
INSERT INTO orders (order_id, user_id, total_price, order_date, status) VALUES
(501, 101, 75.50, '2025-09-01', 'completed'),
(502, 102, 49.99, '2025-09-05', 'completed'),
(503, 103, 120.00, '2025-09-10', 'completed'),
(504, 104, 65.00, '2025-09-12', 'completed'),
(505, 101, 185.00, '2025-09-20', 'pending'),
(506, 105, 75.50, '2025-09-25', 'completed'),
(507, 106, 49.99, '2025-10-01', 'completed'),
(508, 107, 140.50, '2025-10-02', 'pending');

-- Isi tabel order_item 
INSERT INTO order_item (order_item_id, course_id, order_id, price_at_purchase) VALUES
(1, 1002, 501, 75.50),
(2, 1001, 502, 49.99),
(3, 1004, 503, 120.00),
(4, 1005, 504, 65.00),
(5, 1003, 505, 99.00),
(6, 1005, 505, 86.00),
(7, 1002, 506, 75.50),
(8, 1001, 507, 49.99),
(9, 1001, 508, 49.99),
(10, 1002, 508, 90.51);

-- Isi tabel purchased_course 
INSERT INTO purchased_course (purchase_id, course_id, user_id, purchase_date, progress, completion_date, certificate_code, certificate_issued_date) VALUES
(1, 1002, 101, '2025-09-01', 1.0, '2025-09-28', 'CERT-WD-101-ALICE', '2025-09-28'),
(2, 1001, 102, '2025-09-05', 0.8, NULL, NULL, NULL),
(3, 1004, 103, '2025-09-10', 0.5, NULL, NULL, NULL),
(4, 1005, 104, '2025-09-12', 1.0, '2025-10-01', 'CERT-DM-104-EVE', '2025-10-01'),
(5, 1002, 105, '2025-09-25', 0.25, NULL, NULL, NULL),
(6, 1001, 106, '2025-10-01', 0.1, NULL, NULL, NULL);

-- Isi tabel review_course 
INSERT INTO review_course (review_id, user_id, course_id, rating, review) VALUES
(1, 101, 1002, 5.0, 'Excellent course! The instructor explains everything clearly.'),
(2, 102, 1001, 4.0, 'Very helpful content, but some examples were a bit fast.'),
(3, 103, 1004, 5.0, 'Deep and comprehensive. A must for serious JS developers.'),
(4, 104, 1005, 4.5, 'Great overview of digital marketing. The SEO section was fantastic.');

-- Isi tabel section_course 
INSERT INTO section_course (section_id, course_id, title, "order") VALUES
(1, 1001, 'Week 1: The Basics', 1),
(2, 1001, 'Week 2: Data Structures', 2),
(3, 1002, 'Module 1: HTML Essentials', 1),
(4, 1002, 'Module 2: CSS Styling', 2),
(5, 1004, 'Chapter 1: Asynchronous Code', 1);

-- Isi tabel lesson_section 
INSERT INTO lesson_section (lesson_id, section_id, title, "order", content_type) VALUES
(1, 1, 'Introduction to Python', 1, 'video'),
(2, 1, 'Your First "Hello, World!" Program', 2, 'article'),
(3, 2, 'Working with Lists and Tuples', 1, 'video'),
(4, 3, 'Understanding Tags', 1, 'article'),
(5, 3, 'Structuring a Web Page', 2, 'video'),
(6, 4, 'Selectors and Properties', 1, 'video'),
(7, 5, 'Callbacks and Promises', 1, 'video'),
(8, 5, 'Async/Await Explained', 2, 'video');

-- Isi tabel lesson_content 
INSERT INTO lesson_content (content_id, lesson_id, video_url, article_text) VALUES
(1, 1, 'https://example.com/video/py_intro.mp4', NULL),
(2, 2, NULL, 'To print "Hello, World!" in Python, you simply use the print() function. For example: print("Hello, World!")'),
(3, 3, 'https://example.com/video/py_lists.mp4', NULL),
(4, 4, NULL, 'HTML tags are the building blocks of web pages. An HTML element is defined by a start tag, some content, and an end tag.'),
(5, 5, 'https://example.com/video/html_structure.mp4', NULL),
(6, 6, 'https://example.com/video/css_selectors.mp4', NULL),
(7, 7, 'https://example.com/video/js_promises.mp4', NULL),
(8, 8, 'https://example.com/video/js_async_await.mp4', NULL);