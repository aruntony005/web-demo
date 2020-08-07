sudo docker build -t my-demo web-demo/
sudo docker save -o /root/demo-image.tar `docker images --no-trunc | grep -i my-demo | awk '{print \$3}'`
sudo scp -i /root/.ssh/id_rsa /root/demo-image.tar root@worker:/root/
sudo ssh root@worker "sudo docker load -i /root/demo-image.tar"
image_id=`sudo docker images --no-trunc | grep -i my-demo | awk '{print $3}'`
sudo sed "s/WEB-IMAGE/$image_id/g" web-demo/web-deploy.yaml_template > web-demo/web-deploy.yaml
sudo kubectl delete deployment.apps/web-demo
sudo kubectl delete service/web-demo
sudo kubectl create -f web-demo/web-deploy.yaml
sudo kubectl create -f web-demo/web-service.yaml
