# circleci-demo
circleci-demoは、CircleCIを使用して、AWS上でインフラ構築からRailsの環境構築、テストまでを自動で行います。  
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
![sample]()  
# 特徴
- EC2インスタンスはElastic IPを使用しています。
- RDSインスタンスはMySQLを使用しています。
- Railsはproduction環境でデプロイが可能です。
- AWS上でインフラ構築からRailsの環境構築、テストまでを自動で行います。
# 注意事項
初回実行時は、.circleciのconfig.ymlにあるaws-cli-exampleの記載を変更する必要があります。  
## 初回実行時  
```
      - run:
          name: "create stack"
          command: "aws cloudformation create-stack --stack-name circleci-demo-stack --region ap-northeast-1 --template-body file://cfnService.yml"
      - run:
          name: "wait stack complete"
          command: "aws cloudformation wait stack-create-complete --stack-name circleci-demo-stack"
          no_output_timeout: 30m
```  
## 2回目以降  
```
      - run:
          name: "update stack"
          command: "aws cloudformation update-stack --stack-name circleci-demo-stack --region ap-northeast-1 --template-body file://cfnService.yml"
      - run:
          name: "wait stack complete"
          command: "aws cloudformation wait stack-update-complete --stack-name circleci-demo-stack"
          no_output_timeout: 30m
```
