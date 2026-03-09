{{- define "sample-chart.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "sample-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}
