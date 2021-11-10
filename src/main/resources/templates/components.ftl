<#macro badge caption type="default">
  <#assign types = {"default": "bg-secondary", "danger": "bg-danger"}>
  <span class="badge ${types[type]}">${caption}</span>
</#macro>

<#macro button style="default" additionalClasses="" additionalAttributes={} type="" name="" value="">
  <#assign attrib = additionalAttributes>
  <#assign styles = {"default": "btn-secondary", "cta": "btn-primary"}>
  <#if value?has_content>
    <#assign attrib = attrib + {"value": value}>
  </#if>
  <#if type?has_content>
    <#assign attrib = attrib + {"type": type}>
  </#if>
  <#if name?has_content>
    <#assign attrib = attrib + {"name": name}>
  </#if>

  <button class="btn ${styles[style]} ${additionalClasses}" 
  <#list attrib as k, v >
  ${k}="${v}"
  </#list>
  >
    <#nested>
  </button>
</#macro>

<#macro card headingLevel heading href="" footer="">
	<section class="card">
		<div class="card-body">
			<h${headingLevel} class="card-title">
            <#if href?has_content>
			  <a href="${href}">${heading}</a> 
            <#else> 
              ${heading}
            </#if>
			</h${headingLevel}>
			<p class="card-text"><#nested></p>
		</div>
        <#if footer?has_content>
		 <div class="card-footer">${footer}</div>
        </#if>
	</section>
</#macro>

<#macro list items ratio="1/3">
    <#assign keyClass = "col-md-3">
    <#assign valueClass = "col-md-9">
    <dl class="row">
        <#list items as k, v >
            <dt class="${keyClass}">${k}</dt>
            <dd class="${valueClass}">${v}</dd>
        </#list>
    </dl>
</#macro>

<#macro fieldGroup label name type="text" id="" error="" value="">
  <#assign uniqueId = id>
  <#if !uniqueId?has_content>
    <#assign uniqueId = "gen_" + (model["statics"]["java.lang.Math"].random() * 100000)?round?c>
  </#if>
	<div class="field-group">
		<label for="${uniqueId}" class="form-label">${label}</label>
		<input type="${type}" id="${uniqueId}" name="${name}" value="${value}" class="form-control <#if error?has_content>is-invalid</#if> />
      <#if error?has_content>
		    <p class="invalid-feedback">${error}</p>
      </#if>
	</div>
</#macro> 

<#macro mhSection parentHeadingLevel=0>
  <#assign headingLevel = parentHeadingLevel + 1>
  <#nested headingLevel>
</#macro>

<#macro mhHeading headingLevel>
  <h${headingLevel}>
  <#nested>
  </h${headingLevel}>
</#macro>