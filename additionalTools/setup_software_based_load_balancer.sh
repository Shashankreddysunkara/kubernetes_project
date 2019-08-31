##setup Haproxy to work as TCP LoadBalancer 
### Use below url for some more information
##https://tecadmin.net/how-to-setup-haproxy-load-balancing-on-ubuntu-linuxmint/
##https://stackoverflow.com/questions/39016291/haproxy-loadbalancing-tcp-traffic

##configure load balancer -  vi /etc/haproxy/haproxy.cfg
## LoadBalancer Listener config
frontend rserve_frontend
    bind ***.***.***.***:8282
    mode tcp
    option tcplog
    timeout client  1m
    default_backend rserve_backend

## Backend nodes for LB config
backend rserve_backend
    mode tcp
    option tcplog
    option log-health-checks
    option redispatch
    log global
    balance roundrobin
    timeout connect 10s
    timeout server 1m   
    server rserve1 ***.***.***.***:6443 check
    server rserve2 ***.***.***.***:6443 check
	server rserve2 ***.***.***.***:6443 check

## This if for the UI for LoadBalancer config
listen stats ***.***.***.***:8080
    mode http
    log global
    stats enable
    stats realm Haproxy\ Statistics 
    stats uri /haproxy_stats
    stats hide-version
    stats auth admin:*****@rserve
	
	
## Login to LB UI for stats 	
##http://***.***.***.***:8080/stats

## Test Connection to LB listneing service
##kewal@k8master:~$ nc -v ***.***.***.*** 8282
##Connection to ***.***.***.*** 8282 port [tcp/*] succeeded!
