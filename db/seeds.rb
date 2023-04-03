# frozen_string_literal: true

User.create(
  email: 'student@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 0
)
User.create(
  email: 'librarian@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 1
)
User.create(
  email: 'administrator@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 2
)

Book.create(
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  description: "A story of love, wealth, and excess set during the Roaring Twenties.",
  ISBN: "9780743273565",
  published_date: "1925-04-10"
)

Book.create(
  title: "To Kill a Mockingbird",
  author: "Harper Lee",
  description: "A novel that explores the racism and injustice of the American South.",
  ISBN: "9780446310789",
  published_date: "1960-07-11"
)

Book.create(
  title: "1984",
  author: "George Orwell",
  description: "A dystopian novel that portrays a future totalitarian society.",
  ISBN: "9780451524935",
  published_date: "1949-06-08"
)

Book.create(
  title: "Pride and Prejudice",
  author: "Jane Austen",
  description: "A romantic novel that follows the relationships of the Bennet sisters in early 19th-century England.",
  ISBN: "9780141439518",
  published_date: "1813-01-28"
)

Book.create(
  title: "The Catcher in the Rye",
  author: "J.D. Salinger",
  description: "A coming-of-age novel that explores themes of teenage angst and alienation.",
  ISBN: "9780316769174",
  published_date: "1951-07-16"
)

Book.create(
  title: "The Hobbit",
  author: "J.R.R. Tolkien",
  description: "A children's fantasy novel that follows the adventures of Bilbo Baggins.",
  ISBN: "9780618260300",
  published_date: "1937-09-21"
)

Book.create(
  title: "The Lord of the Rings",
  author: "J.R.R. Tolkien",
  description: "An epic high fantasy novel that follows the journey of Frodo Baggins to destroy the One Ring.",
  ISBN: "9780544003415",
  published_date: "1954-07-29"
)

Book.create(
  title: "The Da Vinci Code",
  author: "Dan Brown",
  description: "A thriller novel that follows the investigation of a murder in the Louvre Museum.",
  ISBN: "9780385504201",
  published_date: "2003-03-18"
)

Book.create(
  title: "The Hunger Games",
  author: "Suzanne Collins",
  description: "A dystopian young adult novel that follows a group of teenagers forced to compete in a televised fight to the death.",
  ISBN: "9780439023528",
  published_date: "2008-09-14"
)

Book.create(
  title: "The Girl with the Dragon Tattoo",
  author: "Stieg Larsson",
  description: "A crime thriller novel that follows a journalist and a computer hacker investigating a decades-old disappearance case.",
  ISBN: "9780307269751",
  published_date: "2005-08-01"
)
