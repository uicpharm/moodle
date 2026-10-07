FROM ghcr.io/uicpharm/moodle:5.0.2

# Serve Apache from Moodle's /public directory.
RUN sed -i 's/\/bitnami\/moodle/\/bitnami\/moodle\/public/g' \
        /opt/bitnami/apache/conf/vhosts/moodle-vhost.conf \
        /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf \
    && grep -q '/moodle/public' /opt/bitnami/apache/conf/vhosts/moodle-vhost.conf \
    && grep -q '/moodle/public' /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf
