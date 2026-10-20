<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>App Admin</title>
</head>
<body>
<main class="app-admin-page" role="main">
    <div class="app-admin-header">
        <div>
            <h1>App Admin</h1>
            <p>Edit banner text and the slim emergency link menu shown under the banner.</p>
        </div>
        <g:link controller="home" action="index" class="btn btn-secondary">Home</g:link>
    </div>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <section class="app-admin-section">
        <h2>Banner Text</h2>
        <div class="app-admin-table">
            <g:each in="${bannerTextList}" var="bannerText">
                <g:form controller="appAdmin" action="updateBanner" id="${bannerText.id}" method="POST" class="app-admin-row">
                    <div class="app-admin-field app-admin-slot">
                        <label>Slot</label>
                        <span>${fieldValue(bean: bannerText, field: 'slot')}</span>
                    </div>
                    <div class="app-admin-field">
                        <label for="banner-label-${bannerText.id}">Label</label>
                        <g:textField id="banner-label-${bannerText.id}" name="label" value="${bannerText.label}" maxlength="100"/>
                    </div>
                    <div class="app-admin-field app-admin-wide">
                        <label for="banner-text-${bannerText.id}">Text</label>
                        <g:textField id="banner-text-${bannerText.id}" name="textValue" value="${bannerText.textValue}" maxlength="500"/>
                    </div>
                    <div class="app-admin-field app-admin-small">
                        <label for="banner-sort-${bannerText.id}">Sort</label>
                        <g:field id="banner-sort-${bannerText.id}" name="sortOrder" type="number" value="${bannerText.sortOrder}"/>
                    </div>
                    <label class="app-admin-check">
                        <g:checkBox name="active" value="${bannerText.active}"/>
                        Active
                    </label>
                    <button type="submit" class="btn btn-primary">Save</button>
                </g:form>
            </g:each>
        </div>
    </section>

    <section class="app-admin-section">
        <h2>Quick Links</h2>
        <div class="app-admin-table">
            <g:each in="${quickLinkList}" var="quickLink">
                <div class="app-admin-row app-admin-link-row">
                    <g:form controller="appAdmin" action="updateQuickLink" id="${quickLink.id}" method="POST" class="app-admin-inline-form">
                        <div class="app-admin-field">
                            <label for="link-label-${quickLink.id}">Label</label>
                            <g:textField id="link-label-${quickLink.id}" name="label" value="${quickLink.label}" maxlength="120"/>
                        </div>
                        <div class="app-admin-field">
                            <label for="link-category-${quickLink.id}">Category</label>
                            <g:textField id="link-category-${quickLink.id}" name="category" value="${quickLink.category}" maxlength="100"/>
                        </div>
                        <div class="app-admin-field app-admin-wide">
                            <label for="link-url-${quickLink.id}">URL</label>
                            <g:textField id="link-url-${quickLink.id}" name="url" value="${quickLink.url}" maxlength="1000"/>
                        </div>
                        <div class="app-admin-field app-admin-wide">
                            <label for="link-description-${quickLink.id}">Description</label>
                            <g:textField id="link-description-${quickLink.id}" name="description" value="${quickLink.description}" maxlength="255"/>
                        </div>
                        <div class="app-admin-field app-admin-small">
                            <label for="link-sort-${quickLink.id}">Sort</label>
                            <g:field id="link-sort-${quickLink.id}" name="sortOrder" type="number" value="${quickLink.sortOrder}"/>
                        </div>
                        <label class="app-admin-check">
                            <g:checkBox name="active" value="${quickLink.active}"/>
                            Active
                        </label>
                        <label class="app-admin-check">
                            <g:checkBox name="openInNewWindow" value="${quickLink.openInNewWindow}"/>
                            New tab
                        </label>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </g:form>
                    <g:form controller="appAdmin" action="deleteQuickLink" id="${quickLink.id}" method="POST" class="app-admin-delete-form">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Delete this quick link?');">Delete</button>
                    </g:form>
                </div>
            </g:each>
        </div>

        <h3>Add Quick Link</h3>
        <g:form controller="appAdmin" action="createQuickLink" method="POST" class="app-admin-row app-admin-link-row app-admin-create-row">
            <div class="app-admin-field">
                <label for="new-link-label">Label</label>
                <g:textField id="new-link-label" name="label" maxlength="120" required=""/>
            </div>
            <div class="app-admin-field">
                <label for="new-link-category">Category</label>
                <g:textField id="new-link-category" name="category" value="${newQuickLink.category}" maxlength="100" required=""/>
            </div>
            <div class="app-admin-field app-admin-wide">
                <label for="new-link-url">URL</label>
                <g:textField id="new-link-url" name="url" maxlength="1000" required=""/>
            </div>
            <div class="app-admin-field app-admin-wide">
                <label for="new-link-description">Description</label>
                <g:textField id="new-link-description" name="description" maxlength="255"/>
            </div>
            <div class="app-admin-field app-admin-small">
                <label for="new-link-sort">Sort</label>
                <g:field id="new-link-sort" name="sortOrder" type="number" value="100"/>
            </div>
            <label class="app-admin-check">
                <g:checkBox name="active" value="${true}"/>
                Active
            </label>
            <label class="app-admin-check">
                <g:checkBox name="openInNewWindow" value="${true}"/>
                New tab
            </label>
            <button type="submit" class="btn btn-primary">Add</button>
        </g:form>
    </section>
</main>
</body>
</html>
