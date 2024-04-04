{{/*
Image Url image will be pushed to defaults to internal registry
*/}}
{{- define "image.dev-url" -}}
{{- with .Values.image }}
{{- if eq .registry "Quay" }}
{{- printf "%s/%s/%s" .host .organization .name }}
{{- else }}
{{- printf "%s/vote-app-dev/%s" .host .name }}
{{- end }}
{{- end }}
{{- end }}

{{- define "sha-image.dev-url" -}}
{{- if eq .Values.image.registry "Quay" }}
{{- printf "%s/%s/%s" .Values.image.host .Values.image.organization .Values.image.name }}
{{- else }}
{{- printf "default-route-openshift-image-registry%s/%s-dev/%s" .Values.app.cluster .Values.image.name .Values.image.name }}
{{- end }}
{{- end }}

{{- define "image.preprod-url" -}}
{{- with .Values.image }}
{{- printf "%s/vote-app--preprod/%s" .host .name }}
{{- end }}
{{- end }}

{{- define "image.prod-url" -}}
{{- with .Values.image }}
{{- printf "%s/vote-app-prod/%s" .host .name }}
{{- end }}
{{- end }}
