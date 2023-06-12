FROM ubuntu:18.04

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    rsyslog \
    postfix \
    postfix-policyd-spf-python

# Postfix 설정 파일 복사
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf

# Copy the SSL/TLS certificates
COPY fullchain.pem /etc/ssl/certs/cert.pem
COPY privkey.pem /etc/ssl/private/key.pem

# 포트 열기
EXPOSE 25

# 시작 스크립트 실행
CMD service rsyslog start && service postfix start && tail -f /var/log/mail.log