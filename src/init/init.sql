-- Tipe data kustom sesuai diagram (Enum)
CREATE TYPE order_status AS ENUM ('pending', 'completed', 'failed');
CREATE TYPE lesson_content_type AS ENUM ('video', 'article', 'quiz');

-- Tabel Roles
CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Tabel User_base
CREATE TABLE user_base (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    role_id INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Tabel Profile_User
CREATE TABLE profile_user (
    profile_id INT PRIMARY KEY,
    fullname VARCHAR(255),
    no_hp VARCHAR(50),
    job VARCHAR(255),
    user_id INT UNIQUE NOT NULL,
    working_place VARCHAR(255),
    country_code VARCHAR(10),
    created_date TIMESTAMPTZ DEFAULT NOW(),
    updated_date TIMESTAMPTZ,
    FOREIGN KEY (user_id) REFERENCES user_base(user_id)
);

-- Tabel Course_Categories
CREATE TABLE course_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Tabel Course_base
CREATE TABLE course_base (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    user_id INT NOT NULL, 
    rating REAL, 
    category_id INT,
    review_count INT DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL,
    duration INT,
    certificate BOOLEAN DEFAULT FALSE,
    createdat TIMESTAMPTZ DEFAULT NOW(),
    updatedat TIMESTAMPTZ,
    FOREIGN KEY (user_id) REFERENCES user_base(user_id),
    FOREIGN KEY (category_id) REFERENCES course_categories(category_id)
);

-- Tabel Orders (sebelumnya order_course)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    order_date DATE, 
    status order_status,
    FOREIGN KEY (user_id) REFERENCES user_base(user_id)
);

-- Tabel Order_Item
CREATE TABLE order_item (
    order_item_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    order_id INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course_base(course_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Tabel Purchased_Course
CREATE TABLE purchased_course (
    purchase_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    user_id INT NOT NULL,
    purchase_date DATE,
    progress REAL DEFAULT 0.0, -- tipe Float 
    completion_date DATE,
    certificate_code VARCHAR(255) UNIQUE,
    certificate_issued_date DATE,
    UNIQUE (course_id, user_id),
    FOREIGN KEY (course_id) REFERENCES course_base(course_id),
    FOREIGN KEY (user_id) REFERENCES user_base(user_id)
);

-- Tabel Review_Course
CREATE TABLE review_course (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    rating REAL NOT NULL, -- tipe Float 
    review TEXT,
    createdat TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES user_base(user_id),
    FOREIGN KEY (course_id) REFERENCES course_base(course_id)
);

-- Tabel Section_course
CREATE TABLE section_course (
    section_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    "order" INT, -- Menggunakan kutip dua karena 'order' adalah keyword SQL
    FOREIGN KEY (course_id) REFERENCES course_base(course_id)
);

-- Tabel Lesson_Section
CREATE TABLE lesson_section (
    lesson_id INT PRIMARY KEY,
    section_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    "order" INT, 
    content_type lesson_content_type,
    FOREIGN KEY (section_id) REFERENCES section_course(section_id)
);

-- Tabel Lesson_Content
CREATE TABLE lesson_content (
    content_id INT PRIMARY KEY,
    lesson_id INT UNIQUE NOT NULL,
    video_url VARCHAR(255),
    article_text TEXT,
    FOREIGN KEY (lesson_id) REFERENCES lesson_section(lesson_id)
);