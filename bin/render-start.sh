#!/usr/bin/env bash
# exit on error
set -o errexit

if [ ! -f /opt/render/project/.render/jdk/.jdk_env.sh ]; then
   > /opt/render/project/.render/jdk/.jdk_env.sh
   echo '#!/usr/bin/env bash' >> /opt/render/project/.render/jdk/.jdk_env.sh
   echo 'set -o allexport' >> /opt/render/project/.render/jdk/.jdk_env.sh
   echo 'export JAVA_HOME="/opt/render/project/.render/jdk/jdk-11.0.2"' >> /opt/render/project/.render/jdk/.jdk_env.sh
   echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> /opt/render/project/.render/jdk/.jdk_env.sh
   echo 'set +o allexport' >> /opt/render/project/.render/jdk/.jdk_env.sh
fi

source "/opt/render/project/.render/jdk/.jdk_env.sh"

bin/jemalloc.sh bundle exec puma -C config/puma.rb