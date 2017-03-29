package com.scmastser.test.util.com.froala.editor.video;

import com.scmastser.test.util.com.froala.editor.CustomValidation;
import com.scmastser.test.util.com.froala.editor.file.FileValidation;

public class VideoValidation extends FileValidation {

    public static final String[] allowedVideoExtsDefault = new String[]{"mp4", "webm", "ogg"};

    public static final String[] allowedVideoMimeTypesDefault = new String[]{"video/mp4", "video/webm", "video/ogg"};

    @Override
    protected void initDefault() {

        allowedExts = allowedVideoExtsDefault;
        allowedMimeTypes = allowedVideoMimeTypesDefault;
    }

    public VideoValidation() {
        super();
    }

    public VideoValidation(String[] allowedExts, String[] allowedMimeTypes) {
        super(allowedExts, allowedMimeTypes);
    }

    public VideoValidation(CustomValidation customValidation) {
        super(customValidation);
    }
}
