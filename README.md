<a name="readme-top"></a>

<div align="center">

  <h1><b>Blog app Project with Rails</b></h1>

  <img src="./public/logo.png" alt="logo" width="auto"  height="200">
  <br/>

</div>


# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [🛠 Built With](#built-with)
        - [Tech Stack](#tech-stack)
        - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
    - [Setup](#setup)
    - [Prerequisites](#prerequisites)
    - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

# 📖 Blog App Project <a name="about-project"></a>

This is a project to build a blog app with Ruby on Rails. The main goal is to learn how to build a Rails app from scratch, including the data model, the controllers, views, and tests. The app will have a user model with authentication and authorization, and the users will be able to create, edit, and delete posts and comments.

## 🛠 Built With <a name="built-with"></a>

<ul>
    <li>Ruby 3.2.2</li>
    <li>Rails 7.0.7.2</li>
    <li>PostgreSQL</li>
    <li>Gitflow</li>
    <li>Rubocop</li>
    <li>RSpec</li>
</ul>


### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li><a href="https://www.microverse.org/">Microverse</a></li>
    <li><a href="https://www.ruby-lang.org/">Ruby</a></li>
    <li><a href="https://www.rubyonrails.org/">Rails</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>

### Key Features <a name="key-features"></a>

- **Creating a data model**
- **Processing data in models**
- **Validations and Model specs**
- **Setup and controllers**
- **Controllers specs**
- **Views**
- **Forms**
- **Integration specs for Views and fixing n+1 problems**
- **Devise added for users validation**
- **Add authorization rules**
- **Add API endpoints**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
<ul>
    <li>Windows Subsystem for Linux (WSL)</li>
    <li>Web Browser (Chrome recommended)</li>
    <li>Code editor (VS recommended)</li>
    <li>GitHub account</li>
</ul>

You need the following tools be installed in your computer:

- [WSL](https://gorails.com/setup/windows/11#linux-subsystem)
- [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
- [Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/articles/ruby_installation_instructions.md)
- [Rails](https://gorails.com/setup/windows/11#overview)

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone "https://github.com/sergio-usma/rails_blog_pj.git"
```
### Run

Go to your /blog-app folder:

Install gems

```sh
  bundle install
```
Install npm dependencies

```sh
  npm install
```
Create database, migrations and seed records

```sh
  rails db:create db:migrate db:seed
```
Run rails server in http://127.0.0.1:3000/
```sh
  rails s
```

To run Rails console:

```sh
  cd blog-app
  rails c
```

### Run tests

To run tests:

```sh
  bundle install
  bundle exec rake db:test:prepare
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Author**

- GitHub: [@sergio-usma](https://github.com/sergio-usma)
- Twitter: [@VonUsma](https://twitter.com/vonusma)
- LinkedIn: [Sergio Andres Usma](https://www.linkedin.com/in/sergiousma/)

👤 **Author**

- GitHub: [@Felipe-Perez-Ferraro](https://github.com/Felipe-Perez-Ferraro)
- LinkedIn: [Felipe Perez Ferraro](https://www.linkedin.com/in/felipe-perez-ferraro-6b9358218/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **API documentation**
- [ ] **Add great styling**
- [ ] **Add animations**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project, please consider supporting us! Your support helps us to continue developing and improving our project for everyone to enjoy. Whether it's a small donation, sharing the project with your friends, or contributing your skills and expertise, every little bit makes a huge difference. With your support, we can create something truly amazing together. Thank you for being a part of our community and helping us to make a difference!
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to express my heartfelt gratitude to [Microverse](https://github.com/microverseinc) for providing us with the opportunityto work on this project. and I would like to extend my appreciation to my fellow contributors who have played a significant role in making this project a successful. their dedication and collaboration have been invaluable.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **How do I set up the project?**

    - Clone the repository from GitHub.

- **How can I contribute to the project?**

    1. Fork the repository on GitHub.
    2. Create a new branch for your changes using git checkout -b my-feature-branch.
    3. Make your changes and commit them with descriptive commit messages.
    4. Push your changes to your forked repository.
    5. Submit a pull request to the original repository.
    6. Wait for feedback and iterate on your changes as needed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
 
