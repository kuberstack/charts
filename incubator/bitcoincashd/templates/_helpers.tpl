{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "bitcoincashd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "bitcoincashd.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- /*
Credit: @technosophos
https://github.com/technosophos/common-chart/
labels.standard prints the standard Helm labels.
The standard labels are frequently used in metadata.
*/ -}}
{{- define "bitcoincashd.labels.standard" -}}
app: {{ template "bitcoincashd.name" . }}
heritage: {{ .Release.Service | quote }}
release: {{ .Release.Name | quote }}
chart: {{ template "bitcoincashd.chartref" . }}
{{- end -}}

{{- /*
Credit: @technosophos
https://github.com/technosophos/common-chart/
chartref prints a chart name and version.
It does minimal escaping for use in Kubernetes labels.
Example output:
  zookeeper-1.2.3
  wordpress-3.2.1_20170219
*/ -}}
{{- define "bitcoincashd.chartref" -}}
  {{- replace "+" "_" .Chart.Version | printf "%s-%s" .Chart.Name -}}
{{- end -}}