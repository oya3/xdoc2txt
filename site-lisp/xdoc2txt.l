; -*- Mode: Lisp; Package: editor -*-

#|
= xdoc2txt - pdf, word, excel �Ȃǂ̊e��o�C�i����������e�L�X�g�𒊏o

* Author:  MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/xdoc2txt/intro.htm>))
* Version: 0.8


== ����

((<"xdoc2txt"|URL:http://www31.ocn.ne.jp/~h_ishida/xdoc2txt.html>)) �𗘗p����
pdf, word, excel �Ȃǂ̊e��o�C�i����������e�L�X�g�𒊏o���ĕ\�����܂��B

* find-file-hooks �Ɉ����|���Ď��s���Ă���̂� pdf �Ȃǂ� xyzzy �� D&D ���邾����
  ���e���{���ł��܂��B

* grep-dialog �� pdf �t�@�C���Ȃǂ��J������ grep �ł��܂��B
  * ((<encap|URL:http://www.geocities.co.jp/SiliconValley-PaloAlto/5042/xyzzy/#encap>))
    ���K�v�ł��B
  * ((<ggrep|URL:http://ohkubo.s53.xrea.com/xyzzy/#ggrep>))
    �ɂ��Ή����Ă��܂��B

== �C���X�g�[��

((<NetInstaller|URL:http://www.mirai.ne.jp/~gyo/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ��
3 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/xdoc2txt.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; xdoc2txt
        (require "xdoc2txt")

    ��ggrep.l �����݂���ꍇ�A����� require ���܂��B

(4) �ݒ�𔽉f������ɂ� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B

(5) xdoc2txt ���C���X�g�[�������ꏊ�Ƀp�X��ʂ����A
    ((<*xdoc2txt-command*>)) �Ŏw�肵�܂��B

(6) pdf �t�@�C���Ȃǂ� xyzzy �ŊJ���܂��B


== ���t�@�����X

=== �ϐ�

--- *xdoc2txt-command*
    xdoc2txt �����s����R�}���h���w�肵�܂��B�f�t�H���g�� xdoc2txt �ł��B

    xdoc2txt.exe �Ƀp�X��ʂ��Ă��Ȃ��ꍇ�Ɏw�肵�܂��B
    xdoc2txt.exe �ɓn���I�v�V������ ((< *xdoc2txt-options* >)) �Ŏw�肵�܂��B

    ��:
        (setf *xdoc2txt-command* "C:/Program Files/d2txt120/xdoc2txt.exe")

--- *xdoc2txt-options*
    xdoc2txt.exe �ɓn���I�v�V�����𕶎��� (�܂��̓��X�g) �Ŏw�肵�܂��B

    ��:
        ;; xdoc2txt �ɓn���I�v�V����
        ;;   -c:   PDF �L���b�V�� on
        ;;   -o=0: PDF �� -- ? -- �̌`���̃y�[�W�ԍ���\�����Ȃ�
        ;; http://www31.ocn.ne.jp/~h_ishida/xdoc2txt.html
        (setf *xdoc2txt-options* "-c -o=0")

        ;; ���X�g�`���ł���
        ; (setf *xdoc2txt-options* '("-c" "-o=0"))

--- *xdoc2txt-suffix*
    xdoc2txt �ŊJ���t�@�C���̊g���q (regexp) �̃��X�g�ł��B

    �f�t�H���g�l�͈ȉ��̒ʂ�ł��B(HTML �ȊO�� xdoc2txt ���T�|�[�g���Ă���t�@�C��)

        '("rtf" "doc" "xls" "ppt"
          "j[at]w" "j[bu]w" "j[fv]w" "jt[dt]"
          "oa[s23]"
          "bun"
          "wj[23]" "wk[34]" "123"
          "wri"
          "pdf")

--- *xdoc2txt-fold-width*
    xdoc2txt �ŊJ�����o�b�t�@�̃e�L�X�g�̐܂�Ԃ����@�𐧌䂵�܂��B

    set-buffer-fold-width �̈����Ɏw�肵�܂��B

    * nil:
      �܂�Ԃ��܂���B(�f�t�H���g)
    * t:
      �E�B���h�E�̕��Ő܂�Ԃ��܂��B
    * ���l:
      �܂�Ԃ��ʒu���w�肵�܂��B
    * �֐�:
      �t�@�C������������ funcall �������ʂ�ݒ肵�܂�
      ��L 3 �̂ǂꂩ��Ԃ��悤�ɂ��Ă��������B

    ��:

         ;; 80 �����Ő܂�Ԃ��B
         (setf *xdoc2txt-fold-width* 80)

         ;; Word �t�@�C�������E�B���h�E���Ő܂�Ԃ�
         (setf *xdoc2txt-fold-width* #'(lambda (filename)
                                         (if (string-matchp "\\.doc$" filename)
                                             t
                                           nil)))

--- *xdoc2txt-hook*
    xdoc2txt ���s��Ɏ��s�����t�b�N�ł��Bgrep-dialog �̂Ƃ����Ă΂܂��B

    �f�t�H���g�ł͈ȉ��̂��ݑ|���p�̃t�b�N���o�^����Ă��܂��B

    * ���s���� (^M) �̏C��
    * �����^�u (^K) �̓W�J
    * �s���̋󔒂̍폜

    run-hooks �Ŏ��s����܂��B�����͂���܂���B

    ��:
        ;; pdf �̃y�[�W�ԍ�������
        (defun highlight-pdf-page-number ()
          (make-local-variable 'regexp-keyword-list)
          (setf regexp-keyword-list
                (compile-regexp-keyword-list
                 `(("--[0-9]+/[0-9]+--" t ((0 . (:keyword 0))))))))
        (add-hook '*xdoc2txt-hook* 'highlight-pdf-page-number)

        ;; xdoc2txt �ŊJ�����Ƃ��� view-mode �ɂ���
        (add-hook '*xdoc2txt-hook* 'view-mode)

== ���ꂩ���邩������Ȃ�����

* xdoc2txt �{�̂𓯍�����B

* make-process ���g���đ̊����x�̌���B

* �����^�u�̓W�J���܂��߂ɂ���B

* �ŏ��� undo �ł��Ȃ��悤��
  * clear-undo-boundary �̎g�������悭�킩���B
  * kept-undo-information �� nil �ɂ���̂��y�B
  * *xdoc2txt-hook* ��Ɉꎞ�t�@�C���ɏ����߂���
    ������x insert-file-content ���邩?

* �R�}���h�̑��݃`�F�b�N�B���悢�G���[���b�Z�[�W�B


== �֘A���邩������Ȃ��y�[�W

: xdoc2txt PDF,WORD,EXCEL,�ꑾ�Y�Ȃǂ̊e��o�C�i����������e�L�X�g�𒊏o
    ((<URL:http://www31.ocn.ne.jp/~h_ishida/xdoc2txt.html>))


== ���C�Z���X

xdoc2txt �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2003-2006 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer as the first lines
    of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
|#

(provide "xdoc2txt")
(in-package "editor")

(export '(*xdoc2txt-command*
          *xdoc2txt-options*
          *xdoc2txt-suffix*
          *xdoc2txt-fold-width*
          *xdoc2txt-hook*))

(defvar *xdoc2txt-command* "xdoc2txt"
  "xdoc2txt.exe �ւ̃p�X")

(defvar *xdoc2txt-options* nil
  "xdoc2txt.exe �ɓn���I�v�V�����̃��X�g")

(defvar *xdoc2txt-suffix*
  '("rtf" "doc" "xls" "ppt"
    "j[at]w" "j[bu]w" "j[fv]w" "jt[dt]"
    "oa[s23]"
    "bun"
    "wj[23]" "wk[34]" "123"
    "wri"
    "pdf"
;    "mht" "html"
    ))

(defvar *xdoc2txt-enable-p* t
  "xdoc2txt: non-nil �ɂ���Ɩ�����")

(defvar *xdoc2txt-fold-width* nil
  "xdoc2txt: �e�L�X�g�̐܂�Ԃ����@�𐧌䂵�܂��B
set-buffer-fold-width �̈����Ɏw�肵�܂��B
 nil     �܂�Ԃ��܂���B
 t       �E�B���h�E�̕��Ő܂�Ԃ��܂��B
 ���l    �܂�Ԃ��ʒu���w�肵�܂��B
 �֐�    �t�@�C������������ funcall �������ʂ�ݒ肵�܂�")

(defvar *xdoc2txt-hook* '(xdoc2txt-fix-cr-hook
                          xdoc2txt-fix-vt-hook
                          xdoc2txt-delete-trailing-spaces-hook)
  "xdoc2txt: �t�b�N�Bgrep-dialog �̂Ƃ����Ă΂��B")

(defvar *xdoc2txt-vt-stop* 6)


(defun xdoc2txt-fold-width (filename)
  (if (functionp *xdoc2txt-fold-width*)
      (funcall *xdoc2txt-fold-width* filename)
    *xdoc2txt-fold-width*))

(defun xdoc2txt-command ()
  (map-slash-to-backslash *xdoc2txt-command*))

(defun xdoc2txt-options ()
  (if (listp *xdoc2txt-options*)
      *xdoc2txt-options*
    (list *xdoc2txt-options*)))

(defun xdoc2txt-file-regexp ()
  (format nil "\\.\\(~{~A~^\\|~}\\)$" *xdoc2txt-suffix*))

(defun xdoc2txt-file-matchp (filename)
  (string-matchp (xdoc2txt-file-regexp) filename))

(defun xdoc2txt-commandline (filename)
  (format nil "\"~A\" ~{ ~A~} \"~A\""
          (xdoc2txt-command)
          (xdoc2txt-options)
          (map-slash-to-backslash filename)))

(defun xdoc2txt (filename output &optional (temporary-p nil))
  (let ((fullpath (namestring filename))
        (tmpfile (make-temp-file-name)))
    (call-process (xdoc2txt-commandline fullpath)
                  :output tmpfile
                  :exec-directory (directory-namestring (xdoc2txt-command))
                  :show :minimize
                  :wait t)
    (unless (bufferp output)
      (setf output (or (find-buffer output)
                       (create-new-buffer output))))
    (set-buffer output)
    (xdoc2txt-with-temporary-writable
      (erase-buffer output)
      (insert-file-contents tmpfile t))
    (delete-file tmpfile)
    (xdoc2txt-setup-buffer filename (directory-namestring filename) temporary-p)))

(defun xdoc2txt-setup-buffer (filename defdir temporary-p)
  (xdoc2txt-with-selected-buffer
    (set-buffer (selected-buffer))
    (unless temporary-p
      (set-default-directory defdir)
      (set-buffer-fold-width (xdoc2txt-fold-width filename))
      (make-local-variable 'need-not-save)
      (setq need-not-save t))
    (run-hooks '*xdoc2txt-hook*)
    (update-visited-file-modtime)
    (set-buffer-modified-p nil)))


;;
;; util
;;

(defmacro xdoc2txt-with-temporary-writable (&rest body)
  `(let ((read-only buffer-read-only)
         (modified-p (buffer-modified-p)))
     (setf buffer-read-only nil)
     (unwind-protect
         (progn ,@body)
       (setf buffer-read-only read-only)
       (set-buffer-modified-p modified-p))))
(setf (get 'xdoc2txt-with-temporary-writable 'lisp-indent-hook) 0)

(defmacro xdoc2txt-with-selected-buffer (&body body)
  `(let ((#1=#:obuffer (selected-buffer)))
     (unwind-protect
         (progn ,@body)
       (set-buffer #1#))))
(setf (get 'xdoc2txt-with-selected-buffer 'lisp-indent-hook) 0)


;;
;; hook
;;

(defun xdoc2txt-fix-cr-hook ()
  ;; ppt �ȃt�@�C�����Ɖ��s�� ^M (0x0D (CR (���A))) �ŏo�͂����ꍇ������B
  (save-excursion
    (xdoc2txt-with-temporary-writable
      (replace-buffer "\x0D" "\n"))))

(defun xdoc2txt-fix-vt-hook ()
  ;; ppt �ȃt�@�C�����ƃ^�C�g���s�̍Ōオ ^K (0x0B (VT (�����^�u))) �ɂȂ�ꍇ������B
  (save-excursion
    (xdoc2txt-with-temporary-writable
      (replace-buffer "\x0B" (make-sequence 'string *xdoc2txt-vt-stop* :initial-element #\LFD)))))

(defun xdoc2txt-delete-trailing-spaces-hook ()
  (save-excursion
    (xdoc2txt-with-temporary-writable
      (replace-buffer " +$" "" :regexp t))))

(defun xdoc2txt-find-file (filename)
  (interactive "lFind file: \n" :title0 "Find file")
  (when (get-file-buffer filename)
    (return-from xdoc2txt-find-file (get-file-buffer filename)))
  (xdoc2txt filename (file-namestring filename))
  (selected-buffer))

(defun xdoc2txt-enable-p (filename)
  (if (functionp *xdoc2txt-enable-p*)
      (funcall *xdoc2txt-enable-p* filename)
    *xdoc2txt-enable-p*))

(defun xdoc2txt-find-file-hook (filename)
  (when (and (xdoc2txt-enable-p filename)
             (xdoc2txt-file-matchp filename))
    (xdoc2txt-find-file filename)))

(defun xdoc2txt-add-before-find-file-hook ()
  (interactive)
  (add-hook '*before-find-file-hook* 'xdoc2txt-find-file-hook))

(defun xdoc2txt-delete-before-find-file-hook ()
  (interactive)
  (delete-hook '*before-find-file-hook* 'xdoc2txt-find-file-hook))

(xdoc2txt-add-before-find-file-hook)


;;
;; grep-dialog
;;

(defvar *xdoc2txt-shadow-grep-scanfn-p* t
  "xdoc2txt: scan-files-1 �� shadow ���邩�ǂ����̃t���O")

(defvar *xdoc2txt-shadow-scanfn-list* '((scan-files-1 . xdoc2txt-scan-files-1)
                                        (ggrep-scan-files-1 . xdoc2txt-ggrep-scan-files-1))
  "xdoc2txt: xdoc2txt-scan-files-1 �� shadow ����֐��̃��X�g")

(defvar *xdoc2txt-required-lib-list* '("grep" "grepd" "ggrep")
  "xdoc2txt: ����� require ���郉�C�u�����̃��X�g")

(defvar *xdoc2txt-tmp-buffer-name* "*xdoc2txt tmp*")

;; xdoc2txt �Ή� scan-files-1�B
(defun xdoc2txt-scan-files-1 (basic-definition file pattern buffer scanner)
  (unless (xdoc2txt-file-matchp file)
    (return-from xdoc2txt-scan-files-1
      (funcall basic-definition file pattern buffer scanner)))
  (save-excursion
    (xdoc2txt file buffer t)
    (goto-char (point-min))
    (message "scanning (~A)" file)
    (cond (*grep-name-only*
           (when (funcall scanner)
             (princ file)
             (terpri)
             t))
          (t
           (grep-scan-file file scanner)))))

;; xdoc2txt �Ή� ggrep-scan-files-1�B
(defun xdoc2txt-ggrep-scan-files-1 (basic-definition file patterns buffer scanner common-path &optional linenum-list)
  (unless (xdoc2txt-file-matchp file)
    (return-from xdoc2txt-ggrep-scan-files-1
      (funcall basic-definition file patterns buffer scanner common-path linenum-list)))
  (save-excursion
    (xdoc2txt file buffer t)
    (goto-char (point-min))
    (message "scanning (~A)" (subseq file (length common-path)))
    (cond (*ggrep-name-only* ;; linenum-list ����
           (when (funcall scanner)
             (princ (subseq file (length common-path)))
             (terpri)
             t))
          (t
           (ggrep-scan-file file scanner common-path linenum-list)))))

(defun xdoc2txt-shadow-scan-files-1 ()
  (when (and (find-load-path "encap")
             *xdoc2txt-shadow-grep-scanfn-p*)
    (require "encap")
    (dolist (lib *xdoc2txt-required-lib-list*)
      (when (find-load-path lib)
        (require lib)))
    (dolist (pair *xdoc2txt-shadow-scanfn-list*)
      (when (fboundp (car pair))
        (xdoc2txt-encap-scan-files-1 (car pair) (cdr pair) 'xdoc2txt)))))

(defun xdoc2txt-encap-scan-files-1 (symbol wrapper type)
  (unless (encapsulated-p symbol type)
    (encapsulate symbol type
                 `((apply ',wrapper basic-definition argument-list)))))

;; scan-files-1 �� xdoc2txt �Ή��ɒu��������B
(xdoc2txt-shadow-scan-files-1)

;;
;; End of file
;;