#! /bin/bash

# Run docker yap image with sample file
docker run -v `pwd`/sample.yap:/sample.yap -it yap_image_ub1804 yap -L /sample.yap
