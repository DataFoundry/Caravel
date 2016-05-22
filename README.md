# 使用airbnb caravel进行数据可视化

###  构建并运行caravel
```
oc new-app https://github.com/datafoundry/caravel.git
oc expose svc caravel
```

### 运行mysql
```
oc run mysql \
--image registry.dataos.io/library/mysql \
--env MYSQL_ALLOW_EMPTY_PASSWORD='yes' \
--env MYSQL_DATABASE=demo 
oc expose dc mysql --port=3306
```

###  绑定caravel到mysql
```
oc env dc/caravel DBBSI=MYSQL,BSI_MYSQL_URI=mysql://mysql:3306/demo
```

### 使用浏览器查看数据
登陆caravel route地址，例如caravel.app.dataos.io  
数据用户名密码：admin/caravel_admin
