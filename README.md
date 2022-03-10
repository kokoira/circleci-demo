# circleci-demo
circleci-demoは、CircleCIを使用して、AWS上でインフラ構築からRailsの環境構築、テストまでを自動で行います。 
![ポートフォリオEX](https://user-images.githubusercontent.com/95961416/157727490-eeced343-8f4d-4e0c-8870-29de0c3478ba.gif)  
# 使用技術
- AWS
  - VPC
  - EC2
  - RDS
- Ansible
  - yum
  - Yarn
  - Node.js
  - Ruby
  - MySQL
  - Rails
  - Nginx
  - Unicorn
- Serverspec 
- CircleCI
- Github
# 構成図
![circleci-demo 構成図](https://user-images.githubusercontent.com/95961416/151158772-36907eb6-211d-429a-a205-37d9bb79c3b1.png)
# 特徴
- EC2インスタンスはElastic IPを使用しています。
- RDSインスタンスはMySQLを使用しています。
- Railsはproduction環境でデプロイが可能です。
- AWS上でインフラ構築からRailsの環境構築、テストまでを自動で行います。
# 注意事項
初回実行時と2回目以降実行時では、それぞれ.circleciのconfig.ymlにあるaws-cli-exampleの記載を変更する必要があります。  
### 初回実行時  
```
      - run:
          name: "create stack"
          command: "aws cloudformation create-stack --stack-name circleci-demo-stack --region ap-northeast-1 --template-body file://cfnService.yml"
      - run:
          name: "wait stack complete"
          command: "aws cloudformation wait stack-create-complete --stack-name circleci-demo-stack"
          no_output_timeout: 30m
```  
### 2回目以降実行時  
```
      - run:
          name: "update stack"
          command: "aws cloudformation update-stack --stack-name circleci-demo-stack --region ap-northeast-1 --template-body file://cfnService.yml"
      - run:
          name: "wait stack complete"
          command: "aws cloudformation wait stack-update-complete --stack-name circleci-demo-stack"
          no_output_timeout: 30m
```
