1、部署（配置默认5备份）
# ./main.yml -e '{"app":"es"}' -i group_vars/allhost
或
# ./main.yml -e "app=es" -i group_vars/allhost

2、还原
# ./main.yml -e "{"app":"es","opt":"restore"}" -i group_vars/allhost

3、多实例
编辑install_es.yml内容