<?php

class captchaAction extends FirstendAction {

    public function _empty() {
        Image::buildImageVerify(4, 2, 'png', '300', '100', 'captcha');
    }
}