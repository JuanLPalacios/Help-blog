# Help-blog

a example ruby on rails Help blog for sharing info in times of need

## Built With

- Ruby
- Rails
- RSpec

## Getting Started

Start by seting up the enviroment

```
bundle install
rails db:create
rails db:schema:load
rails db:seed RAILS_ENV=development
rails db:seed RAILS_ENV=test
```

Make sure that the defaut user for system exist in postgres to avoid error `Fatal: Role '[user_name]' does not exist`

```
sudo su - posgres
createuser -s -r [user_name]
logout
```

finally

```
rails s
```

## Unit Tests

To run al tests run

```
rspec --force-color --format documentation
```

## Author

👤 **Juan Luis Palacios**

- GitHub: [@JuanLPalacios](https://github.com/JuanLPalacios)
- Twitter: [@JuanLuisPalac20](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juan-luis-palacios-p%C3%A9rez-95b39a228/)

👤 **Joshua Ivie**

- GitHub: [@joshuaivie](https://github.com/joshuaivie)
- Twitter: [@joshuaivie\_](https://twitter.com/joshuaivie_)
- LinkedIn: [joshuaivie](https://linkedin.com/in/joshuaivie)

👤 **Tadesse Alemayehu**

- GitHub: [@Tadess-Alemayehu](https://github.com/Tadesse-Alemayehu)
- Twitter: [@TadesseWebDev](https://twitter.com/TadesseWebDev)
- LinkedIn: [Tadesse Alemayehu](https://www.linkedin.com/in/tadesse-alemayehu-60141a221/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.
