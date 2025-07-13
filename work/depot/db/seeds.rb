# db/seeds.rb

# Delete all existing products
Product.delete_all

# Create new products
Product.create!(title: 'Design and Build Great Web APIs',
  description: %{<p>
         <em>Robust, Reliable, and Resilient</em>
    APIs are transforming the business world at an increasing pace. Gain
      the essential skills needed to quickly design, build, and deploy
          quality web APIs that are robust, reliable, and resilient. Go from
   initial design through prototyping and implementation to deployment of
     mission-critical APIs for your organization. Test, secure, and deploy
          your API with confidence and avoid the “release into production”
      panic. Tackle just about any API challenge with more than a dozen
          open-source utilities and common programming patterns you can apply
      right away.
      </p>},
  image_url: 'maapis.jpg',
  price: 24.95)

Product.create!(title: 'Mastering JavaScript',
  description: %{<p>
         <em>Unlock the Power of JavaScript</em>
    Dive deep into JavaScript, the language of the web. This course covers
    everything from the basics to advanced concepts, including ES6 features,
    asynchronous programming, and more. Build interactive web applications
    and enhance your skills to become a proficient JavaScript developer.
      </p>},
  image_url: 'maapis.jpg',
  price: 29.99)

Product.create!(title: 'Introduction to Machine Learning',
  description: %{<p>
         <em>Empower Your Data Skills</em>
    Discover the fundamentals of machine learning and how to apply them
    to real-world problems. This course covers supervised and unsupervised
    learning, model evaluation, and practical applications using popular
    libraries like TensorFlow and Scikit-learn.
      </p>},
  image_url: 'maapis.jpg',
  price: 34.95)

Product.create!(title: 'Web Development Bootcamp',
  description: %{<p>
         <em>Become a Full-Stack Developer</em>
    This comprehensive bootcamp takes you from beginner to full-stack
    developer. Learn HTML, CSS, JavaScript, and backend technologies
    to build dynamic web applications. Gain hands-on experience with
    projects and prepare for a career in web development.
      </p>},
  image_url: 'maapis.jpg',
  price: 49.99)

Product.create!(title: 'Data Science with Python',
  description: %{<p>
         <em>Analyze and Visualize Data</em>
    Learn how to use Python for data analysis and visualization. This
    course covers libraries like Pandas, NumPy, and Matplotlib, enabling
    you to manipulate data and create insightful visualizations to
    communicate your findings effectively.
      </p>},
  image_url: 'maapis.jpg',
  price: 39.95)
