<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "form">
        <div class="container-fluid">
            <div class="float-left">
                <img src="${url.resourcesPath}/img/login-bgleft.svg" alt="left" width="20%" class="fixed-bottom"/>
            </div>
            <div class="fixed-top">
                <img src="${url.resourcesPath}/img/login-bg-right.svg" alt="right" class="float-right"  />
            </div>
            <div class="row justify-content-md-center">
                <div class="text-center my-3">
                    <img src="${url.resourcesPath}/img/qriarLogoPreta.svg" class="rounded img-fluid" alt="right" width="300" height="300">
                </div>
            </div>
            
            <div class="row justify-content-md-center">
                <div class="col-sm-6">        
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="p-4 m-1">
                                <h4 class="mb-0 fw-bold">${msg("updatePasswordTitle")}</h4>
                                <p>${msg("resetPasswordMessage")}</p>
                                <form id="kc-form-login" class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction?keep_after('^[^#]*?://.*?[^/]*', 'r')}" method="post">
                                    <input type="text" id="username" name="username" value="${username}" autocomplete="username"
                                            readonly="readonly" style="display:none;"/>
                                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                                    <div class="${properties.kcFormGroupClass!} mb-3">
                                        <div class="${properties.kcLabelWrapperClass!}">
                                            <label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                                        </div>
                                        <div class="${properties.kcInputWrapperClass!}">
                                            <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!} form-control"
                                                    autofocus autocomplete="new-password"
                                                    aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                            />

                                            <#if messagesPerField.existsError('password')>
                                                <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>
                                    </div>

                                    <div class="${properties.kcFormGroupClass!} mb-3">
                                        <div class="${properties.kcLabelWrapperClass!}">
                                            <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                                        </div>
                                        <div class="${properties.kcInputWrapperClass!}">
                                            <input type="password" id="password-confirm" name="password-confirm"
                                                    class="${properties.kcInputClass!} form-control"
                                                    autocomplete="new-password"
                                                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                            />

                                            <#if messagesPerField.existsError('password-confirm')>
                                                <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                                </span>
                                            </#if>

                                        </div>
                                    </div>
                                    <div id="kc-form-buttons" style="margin-top:10px" class="${properties.kcFormButtonsClass!}">
                                        <div class="${properties.kcFormButtonsWrapperClass!}">
                                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} me-2 btn btn-primary" type="submit" value="${msg("doSubmit")}" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            
          </div>
    </#if>
</@layout.registrationLayout>