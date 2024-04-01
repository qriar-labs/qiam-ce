<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section = "form">
        <#if realm.password>
        
        <div class="container-fluid vh-100">
            <div class="row vh-100">
                <div class="col-md-6 bg-light vh-100" style="padding: 0px;">
                    <img src="${url.resourcesPath}/img/Qap.png" alt="Logo" height="100vh" class="mt-0 pt-0" style="height: 100vh;">

                </div>
                <div class="col-md-6 bg-white vh-100">
                    <div class="d-flex flex-column justify-content-center align-items-center h-100">
                        <img src="${url.resourcesPath}/img/Qriarlabs_fundo_claro.png" alt="Logo" width="310" class="mt-0 pt-0">
                        <h3 class="my-4 mt-1" style="padding-left: 23px;font-size: 22px;">API Orchestration Manager</h3>
                        
                     
                        <form id="kc-form-login" class="${properties.kcFormClass!}" style="width: 80% !important; max-width: 400px !important;" onsubmit="login.disabled = true; return true;" action="${url.loginAction?keep_after('^[^#]*?://.*?[^/]*', 'r')}" method="post">
                            <#if message?has_content>
                                <div id="login-alert" class="alert alert-danger col-sm-12 mb-2">
                                    <span class="kc-feedback-text text-danger">${kcSanitize(message.summary)?no_esc}</span>
                                </div>
                            </#if>
                            
                            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                <small class="pb-4 d-block text-right"> 
                                    ${msg("noAccount")}<a href="${properties.urlBase}/register">  ${msg("doRegister")}</a>
                                </small>
                            </#if>
                            
                           
                            <div class="${properties.kcInputWrapperClass!} mb-3">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <label for="username" class="form-label">${msg("email")}</label>
                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!} form-control" name="username" value="${(login.username!'')}" type="text" disabled placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
                                <#else>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!} form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" />
                                </#if>
                            </div>

                            <div class="${properties.kcInputWrapperClass!} mb-3">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <label for="password" class="form-label">${msg("password")}</label>
                                <input tabindex="2" id="password" class="${properties.kcInputClass!} form-control" name="password" type="password" autocomplete="off" placeholder="${msg("password")}"/>
                            </div>
                            <small id="kc-form-options" class="${properties.kcFormOptionsClass!} d-flex">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label class="form-check-label form-label">
                                            <#if login.rememberMe??>
                                                <input tabindex="3" class="form-check-input" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" class="form-check-input" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                    <div style="margin-left:auto;font-size:0.875em;"><a href="${url.loginResetCredentialsUrl}" class="text-decoration-none">${msg("doForgotPassword")}</a></div>
                                </#if>
                            </small>
                            <div id="kc-form-buttons" style="margin-top:10px" class="${properties.kcFormButtonsClass!}">
                                <div class="${properties.kcFormButtonsWrapperClass!}">
                                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} me-2 btn btn-success" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </#if>
    </#if>
</@layout.registrationLayout>